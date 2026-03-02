#!/bin/bash
set -euo pipefail

echo "Installing tree, jq, and nginx"
apt-get update
apt-get install -y tree jq nginx
systemctl enable --now nginx

# Set up IMDSv2 token for EC2 metadata and fetch instance metadata
TOKEN=$(curl -s --fail --show-error --connect-timeout 1 --max-time 2 -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
if [ -z "$TOKEN" ]; then
  echo "Failed to obtain IMDSv2 token; TOKEN is empty" >&2
  exit 1
fi
privateIP=$(curl -s --fail --show-error --connect-timeout 1 --max-time 2 -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)
instanceID=$(curl -s --fail --show-error --connect-timeout 1 --max-time 2 -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
if [ -z "$privateIP" ] || [ -z "$instanceID" ]; then
  echo "Failed to obtain instance metadata; privateIP or instanceID is empty" >&2
  exit 1
fi
export privateIP
export instanceID

# Create a simple index.html file for the nginx web server
sudo cat << EOF > /tmp/index.html
<html>
    <head>
        <title>demo-app</title>
    </head>
    <body>
        <h1 style="text-align: center;">Hello stranger! Welcome to the demo-app!</h1>
        <p style="text-align: center;">
        <img src="Photo by Andrew Schwark from Pexels: https://www.pexels.com/photo/church-georgia-georgia-republic-gergeti-trinity-church-1280841/" alt="demo-app">
        </p>
        <p style="text-align: center;">
        Photo by <a href="https://unsplash.com/@altumcode?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">AltumCode</a> on <a href="https://unsplash.com/s/photos/courses?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
        </p>
        <h2 style="text-align: center;">This message confirms that the demo-app is working with an nginx web server!</h2>
        <h2 style="text-align: center;">Greetings from EC2 instance $instanceID with the private IP of: $privateIP</h2>
    </body>
</html>
EOF

sudo mv /tmp/index.html /var/www/html/index.html

if sudo nginx -t; then
  sudo systemctl reload nginx
else
  echo "nginx config test failed" >&2
  exit 1
fi
