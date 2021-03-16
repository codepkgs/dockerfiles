# 说明

用于查询客户端的 IP 地址信息。

# 使用

* 查询本地 IP 地址
```shell
docker container run -ti --rm cip:latest
```

* 查看多个 IP 地址
```shell
docker container run -ti --rm cip:latest <IP1> [<IP2> ...]
```
