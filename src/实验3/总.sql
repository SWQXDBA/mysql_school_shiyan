USE db_61;
#插入一门“人工智能” 课程，其课程号为C09，2学分；
INSERT INTO course_61
values ('C09', '人工智能', 5, 2, null, '李老师');
#建立一个与选课表结构相同的表SC1_XX（XX代表每个同学的班级序号），并输入若干数据，将SC1_XXX中的数据插入到选课表中
CREATE TABLE SC1_61
(
    SNO   char(20) not null,
    CNO   char(20) not null,
    GRADE int check ( GRADE >= 0 AND GRADE <= 100 ),
    FOREIGN KEY (SNO) REFERENCES Student_61 (SNO),
    FOREIGN KEY (CNO) REFERENCES Course_61 (CNO)
);
INSERT INTO SC1_61
VALUES ('S004', 'C001', 98),
       ('S004', 'C002', 95);
INSERT INTO sc_61
SELECT *
FROM SC1_61;

#2、利用UPDATE语句更改表中数据。
#将 “软件工程系”学生的选修课成绩改为95，并将“数学”系学生的选修课成绩改为90，其他系学生成绩改为85；
UPDATE sc_61 INNER JOIN student_61 s on sc_61.SNO = s.SNO
SET GRADE = 95
WHERE s.SDEPT = '软件工程系';
UPDATE sc_61 INNER JOIN student_61 s on sc_61.SNO = s.SNO
SET GRADE = 90
WHERE s.SDEPT = '数学';
UPDATE sc_61 INNER JOIN student_61 s on sc_61.SNO = s.SNO
SET GRADE = 90
WHERE s.SDEPT != '数学'
  AND S.SDEPT != '软件工程系';

#将“张三”学生的选修课程号改为3；
UPDATE sc_61 INNER JOIN student_61 s on sc_61.SNO = s.SNO
SET CNO = '3'
WHERE s.SNAME = '张三';

#将“李四”学生的“C语言”成绩加5分
UPDATE sc_61 INNER JOIN student_61 s on sc_61.SNO = s.SNO INNER JOIN course_61 c on sc_61.CNO = c.CNO
SET GRADE = GRADE + 5
WHERE s.SNAME = '李四' AND c.CNAME = 'C语言';

#利用DELETE语句删除表中数据。
#删除选修课成绩低于60分的选课记录；
DELETE FROM sc_61 WHERE GRADE < 60;
#删除所有的 “计算机系”的学生选修课记录；
DELETE FROM sc_61 WHERE SNO IN (SELECT SNO FROM student_61 WHERE SDEPT = '计算机系');
