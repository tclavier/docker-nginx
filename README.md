# docker-nginx
Nginx debian base Docker container with letsencrypt support.

If `TLS_DOMAINS` env is set, it launch letsencrypt for `TLS_DOMAINS` at startup with `TLS_EMAIL` as contact. Be careful to mount `/etc/letsencrypt` as volume to not loose your certificates.

To use your letsencrypt certificats you can update your virtual host configuration with : 

      ssl_certificate      /etc/letsencrypt/live/DOMAIN/fullchain.pem;
      ssl_certificate_key  /etc/letsencrypt/live/DOMAIN/privkey.pem;

