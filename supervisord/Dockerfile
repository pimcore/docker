# syntax=docker/dockerfile:1
FROM pimcore/pimcore:PHP8.0-cli
RUN apt-get update && apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf
CMD ["/usr/bin/supervisord"]