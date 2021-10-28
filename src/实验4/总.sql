USE db_61;
#建立一个 “计算机”系的女生名单视图；
CREATE VIEW conputer_girl AS
SELECT *
FROM student_61
WHERE SSEX = '女'
  AND SDEPT = '计算机';



# 建立一个视图STAVG_座号（sno,avgg），avgg为学生选课的平均成绩；
CREATE VIEW STAVG_61 AS
SELECT SNO, AVG(GRADE)
FROM sc_61
group by SNO;
# 建立一个视图STXF_座号（sno,sname，cno ,ccredit），为学生所选选课程的学分一览表；
CREATE VIEW STXF_61 AS
SELECT s.SNO, SNAME, s.CNO, CREDIT
FROM student_61
         INNER JOIN sc_61 s on student_61.SNO = s.SNO
         INNER JOIN course_61 c on s.CNO = c.CNO;
# 查询视图STAVG_座号中"01"号学生的平均成绩和姓名 、
#因为AVG(GRADE)比较特殊 用反单引号包起来才可以查 反单引号是键盘上~所在的键
SELECT SNAME, `AVG(GRADE)` AS 平均成绩
FROM STAVG_61
         inner join student_61 s on STAVG_61.SNO = s.SNO
WHERE STAVG_61.SNO = 'S001';
# 将视图STXF_座号中"C2"号课程的学分改为4.5学分，并查看修改结果
#这里学分是int 改的时候如果输入小数会四舍五入
UPDATE STXF_61 SET CREDIT = 4.5 WHERE CNO = 'C002';
# 删除视图STAVG_座号
DROP VIEW STAVG_61;

# 利用sql server management studio用交互方式和命令方式创建一个新的登录名和用户，要求：
#登录名用自己的姓名拼音字母；
CREATE USER 'YE_SHU_CHANG' IDENTIFIED BY 'pass';
# 查询所创建的登录和用户。
USE  mysql;
SELECT user FROM user;
#对创建的新用户授权和撤权，并检查权限是否生效并截图。
#GRANT (SELECT/UPDATE/ALL/INSERT) ON (数据库名字).(表名 用*表示所有表) TO (角色名/用户名)
GRANT SELECT ON db_61.* TO 'YE_SHU_CHANG';
#查询权限
SHOW GRANTS FOR 'YE_SHU_CHANG';

# 3. 利用sql server management studio用交互方式和命令方式创建一个新的角色，要求：
# 1) 以姓名拼音加上两位座号为角色名；
CREATE ROLE 'YE_SHU_CHANG_61';
# 2) 给角色授予权限；
GRANT SELECT,UPDATE ON db_61.* TO 'YE_SHU_CHANG_61';
# 3) 将角色授予用户。
GRANT 'YE_SHU_CHANG_61' TO 'YE_SHU_CHANG';
# 4. 以新用户登录，查看其状态并截图。
# 5．利用SQL SERVER 中的数据备份的方法和恢复机制，完成：

# 1）创建一个数据库备份。
#mysqldump -u root -p abc > /backup/abc.sql

# 2）利用备份恢复，将恢复的数据库命名为HFDB_座号。
CREATE DATABASE HFDB_61;#先创建数据库
USE HFDB_61;#选中数据库
#mysql -u root -p < /backup/all-data.sql
#执行恢复语句