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