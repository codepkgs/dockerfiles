#!/bin/sh

sed -i "s/PH_YAPI_ADMIN_ACCOUNT/${YAPI_ADMIN_ACCOUNT}/g" /yapi/config.json
sed -i "s/PH_YAPI_CLOSE_REGISTER/${YAPI_CLOSE_REGISTER}/g" /yapi/config.json
sed -i "s/PH_YAPI_VERSION_NOTIFY/${YAPI_VERSION_NOTIFY}/g" /yapi/config.json
sed -i "s/PH_YAPI_DB_SERVER_NAME/${YAPI_DB_SERVER_NAME}/g" /yapi/config.json
sed -i "s/PH_YAPI_DB_DATABASE/${YAPI_DB_DATABASE}/g" /yapi/config.json
sed -i "s/PH_YAPI_DB_PORT/${YAPI_DB_PORT}/g" /yapi/config.json

cd /yapi/vendors
sleep 10

if [ ! -e "init.lock" ]; then
    npm run install-server
    touch init.lock
fi

node server/app.js
