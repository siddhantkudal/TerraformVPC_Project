#!/bin/bash
# Update and install Apache
sudo apt update
sudo apt install -y apache2 awscli

# Fetch the instance ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Create an HTML file with the instance ID
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Static Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
            text-align: center;
        }
        header {
            background: #4CAF50;
            color: white;
            padding: 20px 0;
        }
        section {
            padding: 20px;
        }
        footer {
            background: #333;
            color: white;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to My Static Website</h1>
    </header>
    <section>
        <p>This is a demo static website deployed on an EC2 instance.</p>
        <h3>Instance ID: <span>$INSTANCE_ID</span></h3>
        <p>Enjoy exploring AWS services!</p>
    </section>
    <footer>
        <p>© 2024 MyWebsite. All rights reserved.</p>
    </footer>
</body>
</html>
EOF

# Start and enable Apache
sudo systemctl start apache2
sudo systemctl enable apache2
