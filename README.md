# 说明

该环境安装 PHP 7.4，启动 `php-fpm`。

- 版本  
   操作系统版本：`CentOS 7.6 1810`  
  `PHP版本`：`PHP 7.4 `

- `yum` 源  
  采用的 `remi` 的镜像源。

# 环境变量

## 变量说明

所有变量采用大写，变量名为 `前缀 + 字段名` 的形式。

**前缀**

1. 以 `PHP_INI_` 开头的变量表示的是在 `php.ini` 文件中定义的变量。
2. 以 `PHP_FPM_` 开头的变量表示的是在 `php-fpm.d/www.conf` 文件中定义的变量。
3. 以 `PHP_SEASLOG_` 开头的变量表示的是在 `php.d/40-seaslog.ini` 文件中定义的变量。

- `MEMORY_LIMIT`  
   设置了一个脚本允许分配的最大内存量。设置为 -1，如果要修改，需要修改配置文件 `php.ini`

- `PHP_INI_POST_MAX_SIZE`  
   允许 `post` 数据的最大大小。0 表示关闭限制。

- `PHP_INI_UPLOAD_MAX_FILESIZE`  
   最大允许的上传文件大小。如 `20M`

- `PHP_FPM_PM`  
   设置 FPM 进程类型，如 `static`、`dynamic`。

- `PHP_FPM_PM_MAX_CHILDREN`  
   最大允许的子进程数。

- `PHP_FPM_PM_START_SERVERS`  
   启动的时候创建多少个子进程。该参数必须要大于等于变量 `PHP_FPM_PM_MIN_SPARE_SERVERS` 所设置的值，小于等于变量 `PHP_FPM_PM_MAX_SPARE_SERVERS` 所设置的值。

- `PHP_FPM_PM_MIN_SPARE_SERVERS`  
   最小空闲子进程数。

- `PHP_FPM_PM_MAX_SPARE_SERVERS`  
   最大空闲子进程数。

- `PHP_FPM_PM_MAX_REQUESTS`  
   子进程处理完多少个请求后就退出，然后在 `respawn` 一个新的子进程。

# 使用

使用 `php-fpm -i` 查看所有 `php ini` 的参数值，使用 `php-fpm -tt` 查看 `php-fpm` 的配置参数值。

- `PHP-FPM`

  ```Dockerfile
  EXPOSE 9000
  CMD ["/usr/bin/php-fpm", "--nodaemonize"]
  ```
