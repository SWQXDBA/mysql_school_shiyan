USE db_61;
# 1、求选修“C01”号课程的学生学号和成绩，并要求对查询结果按成绩排列，如果成绩相同则按学号排列。
SELECT SNO 学号, GRADE 成绩
FROM sc_61
WHERE CNO = 'C001'
ORDER BY GRADE DESC, SNO;
#获选修课程“C021”且成绩在0～60分之间的学生学号和成绩，并将成绩乘以系数1.2输出。
SELECT SNO 学号, GRADE * 1.2 成绩
FROM sc_61
WHERE GRADE >= 0
  AND GRADE <= 60;
#求选修了“Python”课程的学生学号和姓名。
SELECT student_61.SNO 学号, SNAME 姓名
FROM student_61
         INNER JOIN sc_61 ON student_61.SNO = sc_61.SNO
         INNER JOIN
     course_61 on
         sc_61.CNO = course_61.CNO
WHERE course_61.CNAME = 'Python';
#求每门选修课的平均成绩。
SELECT CNO 课程号, AVG(GRADE) 平均成绩
FROM sc_61
GROUP BY CNO;
#求有两门选修课程成绩大于90分的学生学号。
SELECT SNO 学号
FROM sc_61
WHERE GRADE > 90
GROUP BY SNO
HAVING COUNT(*) = 2;
#求“CO5”号课程的成绩高于“张三”的学生学号和成绩。
SELECT student_61.SNO 学号, GRADE 成绩
FROM sc_61
         INNER JOIN student_61 ON sc_61.SNO = student_61.SNO
WHERE CNO = 'C05'
  AND GRADE >
      (SELECT GRADE
       FROM sc_61
                INNER JOIN student_61 ON sc_61.SNO = student_61.SNO
       WHERE student_61.SNAME = '张三'
         AND sc_61.CNO = 'C05');

/*#求“CO5”号课程的成绩高于“张三”的学生学号和成绩。
SELECT student_61.SNO 学号, GRADE 成绩
FROM sc_61
         INNER JOIN student_61 ON sc_61.SNO = student_61.SNO
WHERE CNO = 'C002'
  AND GRADE >
      (SELECT GRADE
       FROM sc_61
                INNER JOIN student_61 ON sc_61.SNO = student_61.SNO
       WHERE student_61.SNAME = 'xiaohong'
         AND sc_61.CNO = 'C002');*/

# 求其他系中年龄小于“软件工程系”年龄最大者的学生。
SELECT *
FROM student_61
WHERE year(now()) - year(Sage) <
      (SELECT MAX(year(now()) - year(Sage)) AS 最大年龄 FROM student_61 WHERE SDEPT = '软件工程系');
#求其他系中比“软件工程系”学生年龄都小的学生。
SELECT *
FROM student_61
WHERE year(now()) - year(Sage) <
      (SELECT MIN(year(now()) - year(Sage)) AS 最大年龄 FROM student_61 WHERE SDEPT = '软件工程系');
#查询选修了全部课程的学生的姓名。
SELECT Sname
FROM student_61
WHERE SNO IN ((SELECT SNO
               FROM sc_61
               GROUP BY SNO
               HAVING COUNT(*)
                          = (SELECT COUNT(*) FROM course_61)));
#求选修了学号为“S02”的学生所选修的全部课程的学生学号和姓名。P40
#查出选课号在S02学生选的课程中的数据 按照SNO进行分组 然后看看数量和SNO选的数量一不一样
SELECT student_61.SNO 学号, student_61.SNAME 姓名
FROM student_61
WHERE student_61.SNO IN
      (SELECT SNO
       FROM sc_61
       WHERE SNO != 'S02'
         AND CNO IN (SELECT CNO FROM sc_61 WHERE SNO = 'S02')
       GROUP BY SNO
       having COUNT(*) = (SELECT COUNT(*) FROM sc_61 WHERE SNO = 'S02'));
#求学生的学号、姓名、选修的课程名及成绩。
SELECT student_61.SNO 学号, student_61.SNAME 姓名 ,c.CNAME 课程名,s.GRADE 成绩
FROM student_61
         INNER JOIN sc_61 s on student_61.SNO = s.SNO
         INNER JOIN course_61 c on s.CNO = c.CNO;

#表示学生和课程之间的自然连接、左外部连接和右外部连接。
select* from student_61  inner join sc_61 s on student_61.SNO = s.SNO;
select* from student_61  left outer join sc_61 s on student_61.SNO = s.SNO;
select* from student_61  right outer  join sc_61 s on student_61.SNO = s.SNO;