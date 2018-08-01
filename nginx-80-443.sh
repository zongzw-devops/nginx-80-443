docker run \
    --name nginx-$(date +%s) \
    -itd \
    -p 80:80 -p 443:443 \
    -v $(pwd)/conf.d:/etc/nginx/conf.d \
    nginx:latest \
    /bin/bash -c "echo Nginx Running: \$(hostname) > /usr/share/nginx/html/index.html && exec nginx -g 'daemon off;'"

