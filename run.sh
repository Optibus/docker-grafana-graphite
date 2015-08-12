#!/bin/bash

rm -f /var/lib/graphite/storage/*.pid
mkdir -p /var/lib/elasticsearch
chown -R elasticsearch:elasticsearch /var/lib/elasticsearch
mkdir -p /var/lib/graphite/storage/whisper
mkdir -p /var/lib/graphite/storage/log/webapp
touch /var/lib/graphite/storage/graphite.db /var/lib/graphite/storage/index
chown -R www-data /var/lib/graphite/storage
chmod 0775 /var/lib/graphite/storage /var/lib/graphite/storage/whisper
chmod 0664 /var/lib/graphite/storage/graphite.db
cd /var/lib/graphite/webapp/graphite && python manage.py syncdb --noinput
/usr/bin/supervisord -n
