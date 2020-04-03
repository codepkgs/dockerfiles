#!/bin/sh

# sed config
sed -i "s/PH_YAPI_ADMIN_ACCOUNT/${YAPI_ADMIN_ACCOUNT}/g" /yapi/config.json
sed -i "s/PH_YAPI_CLOSE_REGISTER/${YAPI_CLOSE_REGISTER}/g" /yapi/config.json
sed -i "s/PH_YAPI_VERSION_NOTIFY/${YAPI_VERSION_NOTIFY}/g" /yapi/config.json
sed -i "s/PH_YAPI_DB_SERVER_NAME/${YAPI_DB_SERVER_NAME}/g" /yapi/config.json
sed -i "s/PH_YAPI_DB_DATABASE/${YAPI_DB_DATABASE}/g" /yapi/config.json
sed -i "s/PH_YAPI_DB_PORT/${YAPI_DB_PORT}/g" /yapi/config.json
#sed -i "s/PH_YAPI_MAIL_ENABLE/${YAPI_MAIL_ENABLE}/g" /yapi/config.json
#if [ -n "$YAPI_MAIL_HOST" ]; then
#    sed -i "s/PH_YAPI_MAIL_HOST/${YAPI_MAIL_HOST}/g" /yapi/config.json
#fi
#
#if [ -n "$YAPI_MAIL_PORT" ]; then
#    sed -i "s/PH_YAPI_MAIL_PORT/${YAPI_MAIL_PORT}/g" /yapi/config.json
#fi
#
#if [ -n "$YAPI_MAIL_FROM" ]; then
#    sed -i "s/PH_YAPI_MAIL_FROM/${YAPI_MAIL_FROM}/g" /yapi/config.json
#fi
#
#if [ -n "$YAPI_MAIL_AUTH_USER" ]; then
#    sed -i "s/PH_YAPI_MAIL_AUTH_USER/${YAPI_MAIL_AUTH_USER}/g" /yapi/config.json
#fi
#
#if [ -n "$YAPI_MAIL_AUTH_PASS" ]; then
#    sed -i "s/PH_YAPI_MAIL_AUTH_PASS/${YAPI_MAIL_AUTH_PASS}/g" /yapi/config.json
#fi

python /check-mongo-init.py
retval=$?

cd /yapi/vendors

if [ $retval -eq 0 ]; then
    node server/install.js
    python /init-mongo.py
    node server/app.js
else
    node server/app.js
fi
