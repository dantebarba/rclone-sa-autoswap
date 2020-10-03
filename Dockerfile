FROM alpine

WORKDIR /app

RUN apk add --no-cache sed dcron -q

ADD replace.sh .
RUN chmod +x replace.sh

ADD cron.sh /usr/bin/cron.sh
RUN chmod +x /usr/bin/cron.sh

RUN touch /var/log/replace.log

ENV PREFIX '/config/sa/gdrive-sa-'
ENV MAX_NUMBER 1
ENV CRON '0 * * * *'
ENV CONFIG_DIR '/config/rclone.conf'

ENTRYPOINT ["/bin/sh", "/usr/bin/cron.sh"]
