# syntax=docker/dockerfile:1
FROM pimcore/pimcore:PHP8.0-cli
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-n"]