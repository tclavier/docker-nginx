# docker-nginx
Nginx debian base Docker container with letsencrypt support.

If `TLS_DOMAINS` env is set, it launch letsencrypt for all domains in `TLS_DOMAINS` at startup with `TLS_EMAIL` as contact. 
Be careful to mount `/etc/letsencrypt` as volume to not loose your certificates. And do not share this volume between instances of this container.


In `TLS_DOMAINS` you should separate domains by space. The first mentioned domain in `TLS_DOMAINS` will be used to save certificate. [Certbot](https://github.com/certbot/certbot) will save a multi-domains certificate in `/etc/letsencrypt/archive/FIRST_DOMAIN`

To use your letsencrypt certificats you can update your virtual host configuration with : 

      ssl_certificate      /etc/letsencrypt/live/FIRST_DOMAIN/fullchain.pem;
      ssl_certificate_key  /etc/letsencrypt/live/FIRST_DOMAIN/privkey.pem;

