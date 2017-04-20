# docker-nginx
Nginx debian base Docker container with letsencrypt support.

If `TLS_DOMAINS` env is set, it launch letsencrypt for all domains in `TLS_DOMAINS` at startup with `TLS_EMAIL` as contact. 
Be careful to mount `/etc/letsencrypt` as volume to not loose your certificates. 


In `TLS_DOMAINS` you should separate domains by space. For each domain mentioned in `TLS_DOMAINS` [certbot](https://github.com/certbot/certbot) will request a new certificate.

To use your letsencrypt certificats you can update your virtual host configuration with : 

      server_name DOMAIN;
      ssl_certificate      /etc/letsencrypt/live/DOMAIN/fullchain.pem;
      ssl_certificate_key  /etc/letsencrypt/live/DOMAIN/privkey.pem;

Be careful with `server_name` and `ssl_certificate` order for SNI configuration.
