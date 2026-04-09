#!/bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1>Terraform in one shot for DevOps</h1>" | sudo tee /var/www/html/index.html
#<h1>   #heading in html "h1"--start
#</h1> #heading closed 
#sudo tee---- iska output iss file me append krdiya /var/www/html/index.html