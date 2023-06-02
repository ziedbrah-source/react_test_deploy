server {
    listen 80;
    listen [::]:80;

   server_name devsecops-gl4-2022-2023.top;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        return 301 https://portfolio.devsecops-gl4-2022-2023.top$request_uri;
    }
}
server {
    listen 443 default_server ssl http2;
    listen [::]:443 ssl http2;

    server_name example.org;

    ssl_certificate /etc/nginx/ssl/live/devsecops-gl4-2022-2023.top/fullchain.pem;
    ssl_certificate_key /etc/nginx/ssl/live/devsecops-gl4-2022-2023.top/privkey.pem;
    
    location / {
        root /usr/share/nginx/html/;
        include /etc/nginx/mime.types;
        try_files $uri $uri/ /index.html;
    }
}