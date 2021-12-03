sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

sudo echo "This is test website from packer" >> /var/www/html/inde.html
sudo chown apache. /var/www/html/ -R