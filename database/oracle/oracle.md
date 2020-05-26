## 根据注释查询表信息
```oracle
select * from all_tab_comments; -- 查询所有用户的表,视图等。
select * from user_tab_comments; -- 查询本用户的表,视图等。
select * from all_col_comments;  --查询所有用户的表的列名和注释。
select * from user_col_comments; -- 查询本用户的表的列名和注释。
select * from all_tab_columns; --查询所有用户的表的列名等信息。
select * from user_tab_columns; --查询本用户的表的列名等信息。
```
说明：
ORACLE下有三个视图
* DBA_TABLES  拥有DBA角色的用户可以查看系统中的所有表
* USER_TABLES 登录数据库的当前用户拥有的所有表
* ALL_TABLES 登录数据库的当前用户有权限查看的所有表




demo: 查询表注释里包含供地方案的表

` select * from all_tab_comments where comments like '%供地方案%' `

---
## 查看oracle执行计划
示例：查看select * from SYS_DEPT执行计划
```oracle
 explain plan for  select * from SYS_DEPT;
 select * from table(dbms_xplan.display)
```
