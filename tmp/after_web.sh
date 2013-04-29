#!/bin/bash

sed -i 's/^Listen.*/Listen 8080/g' /etc/apache2/conf/ports.conf
update-rc.d nginx defaults
update-rc.d apache defaults
initctl reload-configuration
rm -f /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/ckan /etc/nginx/sites-enabled/ckan
a2dissite default
a2ensite ckan


service apache2 restart
service nginx restart
