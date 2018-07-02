#!/bin/bash

sed -i -e "s/DATABASE_URL=.*/DATABASE_URL=mysql:\/\/root:mypw@mysql:3306\/sfreact/" /opt/symfony-react-sandbox/.env
sed -i -e "s/listen =.*/listen = 0.0.0.0:9000/" /etc/php/7.2/fpm/pool.d/www.conf
echo "security.limit_extensions=" >> /etc/php/7.2/fpm/pool.d/www.conf
chmod 777 -R *
/etc/init.d/php7.2-fpm start
sleep 20
bin/console doctrine:database:create -q 
bin/console doctrine:schema:create -q 
bin/console doctrine:fixtures:load -q
./node_modules/.bin/encore dev --config webpack.config.serverside.js
#./node_modules/.bin/encore dev-server --host 0.0.0.0 &
./node_modules/.bin/encore dev --config webpack.config.js
bin/console server:run 0.0.0.0:8080