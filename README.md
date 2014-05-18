# docker_nginx
* Nginx running with supervisord.
* Volume mount configs to /nginx
** /nginx/config/nginx.conf

```
docker run --name="nginx" -d -p 80:80 -p 443:443 -v $HOME/nginx:/nginx jimshoe/nginx
```
