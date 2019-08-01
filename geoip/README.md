# 说明

调用https://api.ip.sb/geoip获取当前的IP地址的geo信息或指定IP地址的geo信息。

* 使用
    ```
    1. 获取当前ip地址的geo信息
    docker container run -ti --rm geoip

    2. 获取指定IP地址的geo信息
    docker container run -ti --rn geoip <ip-address>
    ```
