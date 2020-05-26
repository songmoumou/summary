
## 查看执行计划
示例：查看select * from SYS_DEPT执行计划
```mysql
 explain select * from sys_dept
```
## 查看所有表
* 方式一：
```mysql
# ry数据库名称
select * from information_schema.tables where table_schema='ry'; 
```
* 方式二：
```mysql
# 查询所有数据库
SHOW DATABASES;
SHOW TABLES;
```