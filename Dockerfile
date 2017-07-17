from debian:testing
env DEBIAN_FRONTEND noninteractive
#run sed -e 's/deb.debian.org/debian.mirrors.ovh.net/g' -i /etc/apt/sources.list
run apt-get update && \
    apt-get install -y --no-install-recommends nginx certbot && \
    apt-get clean

run mv /etc/nginx/nginx.conf /tmp/ &&\
    echo "daemon off;" > /etc/nginx/nginx.conf && \
    echo "error_log /dev/stdout info;" >> /etc/nginx/nginx.conf && \
    cat /tmp/nginx.conf >> /etc/nginx/nginx.conf && \
    rm /tmp/nginx.conf

add stdout.conf /etc/nginx/conf.d/
add start /usr/local/bin/start
run chmod +x /usr/local/bin/start

expose 80 443

cmd ["/usr/local/bin/start"]
