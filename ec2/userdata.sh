user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y 
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo chown -R $USER:$USER /var/www/html
                sudo bash -c "echo your very first web server > /var/www/html/index.html"
                EOF 
