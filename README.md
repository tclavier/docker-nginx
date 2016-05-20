# docker-nginx
Nginx debian base Docker container.

If `TLS_DOMAIN` env is set, it launch letsencrypt for `TLS_DOMAIN` at startup. Be careful to mount `/etc/letsencrypt` as volume to not loose your certificates.
