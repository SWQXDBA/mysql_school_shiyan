USE db_61;
ALTER TABLE Course_61 ADD teacher char(20);
ALTER TABLE course_61 ADD CONSTRAINT course_61_chk_credit CHECK ( CREDIT <=6 );
