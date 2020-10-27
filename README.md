# 使用

该镜像应该配合 `zhh1115/php74-fpm` 来使用。

1. 默认的 `default.conf` 配置文件

```nginx
server {
    listen 80 default_server backlog=65535;
    server_name localhost;

    root        /app;
    index       index.php;

    location / {
        try_files   $uri $uri/ /index.php$is_args$args;
    }

    location ~ \.php$ {
        fastcgi_pass    127.0.0.1:9000;
        fastcgi_index   index.php;
        fastcgi_param   SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include         fastcgi_params;
    }
}
```

如果配置文件不一致，可以使用自己的文件替换该配置文件。


2. `access_log` 和 `error_log`

日志文件应该写入到如下位置或者不设置，默认全局设置为：

```text
access_log /var/log/nginx/access.log;
error_log /var/log/nginx/error.log;
```

`access.log` 会输出到 `stdout`, `error.log` 会输出到 `stderr`。


