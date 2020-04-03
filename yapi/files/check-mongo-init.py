#!/usr/bin/env python
# coding:utf-8

from pymongo import MongoClient
import sys

conn = MongoClient('yapi-mongo', 27017)
db = conn.yapi
init = db.init_yapi

count = init.find({"yapi-init": 1}).count()
if count == 0:
    sys.exit(0)
else:
    sys.exit(1)
