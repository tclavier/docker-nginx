from debian
run apt-get update && \
    apt-get install -y --no-install-recommends nginx && \
    apt-get clean

run mv /etc/nginx/nginx.conf /tmp/ &&\
    echo "daemon off;" > /etc/nginx/nginx.conf && \
    echo "error_log /dev/stdout info;" >> /etc/nginx/nginx.conf && \
    cat /tmp/nginx.conf >> /etc/nginx/nginx.conf && \
    rm /tmp/nginx.conf

add stdout.conf /etc/nginx/conf.d/

expose 80

cmd /etc/init.d/nginx start
