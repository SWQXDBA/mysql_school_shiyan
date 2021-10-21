# 建库语句
DROP DATABASE IF EXISTS  DB_61;
CREATE DATABASE DB_61;
USE DB_61;
# 建表语句
DROP TABLE IF EXISTS Student_61;
CREATE TABLE Student_61(
                           SNO char(20) primary key not null ,
                           SNAME char(20) not null,
                           SSEX char(20) check ( SSEX='男' or SSEX = '女' ) not null ,
                           Sage datetime not null,
                           SDEPT char(20) not null
);
CREATE TABLE Course_61(
                          CNO char(20) not null primary key,
                          CNAME char(20) not null,
                          Semester int check ( Semester in (1,2,3,4,5,6,7,8) ),
                          CREDIT int not null default 3,
                          Pcno char(20)
);
CREATE TABLE SC_61(
                      SNO char(20) not null,
                      CNO char(20) not null,
                      GRADE int check ( GRADE>=0 AND GRADE <=100 ),
                      FOREIGN KEY (SNO) REFERENCES Student_61(SNO),
                      FOREIGN KEY (CNO) REFERENCES Course_61(CNO)
);
# 修改表
ALTER TABLE Course_61 ADD teacher char(20);
ALTER TABLE course_61 ADD CONSTRAINT course_61_chk_credit CHECK ( CREDIT <=6 );
# 插入语句
INSERT INTO student_61 VALUES ('S001','xiaoming','男','2000-2-1','计算机'),
                              ('S002','xiaohong','女','2001-1-1','计算机'),
                              ('S003','xiaowang','男','2001-5-3','中文');

INSERT INTO course_61 VALUES ('C001','语文',1,3,'','王华'),
                             ('C002','历史',1,3,'','汪强'),
                             ('C003','数学',2,3,'','瑞红');

INSERT INTO sc_61 VALUES ('S001','C001',98),
                         ('S001','C002',95),
                         ('S001','C003',93),
                         ('S002','C001',99),
                         ('S002','C002',88),
                         ('S002','C003',77),
                         ('S003','C001',66),
                         ('S003','C002',100),
                         ('S003','C003',99);