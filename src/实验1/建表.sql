USE DB_61;
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