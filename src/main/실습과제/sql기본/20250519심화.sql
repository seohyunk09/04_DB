-- 1단계: 데이터베이스 선택
USE tabledb;

-- 다음 컬럼을 가지는 userTBL과 buyTBL을 정의하세요.

DROP TABLE IF EXISTS buyTBL;
DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL (
                         userID CHAR(8) NOT NULL PRIMARY KEY,
                         name VARCHAR(10) NOT NULL,
                         birthyear INT NOT NULL
);

CREATE TABLE buyTBL (
                        num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        userID CHAR(8) NOT NULL,
                        prodName CHAR(6) NOT NULL,
                        FOREIGN KEY (userID) REFERENCES userTBL(userID)
);


-- 다음 조건을 만족하는 userTBL 테이블을 정의하세요.

DROP TABLE IF EXISTS buyTBL;
DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL (
                         userID CHAR(8) NOT NULL PRIMARY KEY,
                         name VARCHAR(10) NOT NULL,
                         birthyear INT NOT NULL,
                         email CHAR(30) UNIQUE
);


-- birthYear 범위 제한, mobile 필수
DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL (
                         userID CHAR(8) NOT NULL PRIMARY KEY,
                         name VARCHAR(10),
                         birthYear INT CHECK (birthYear BETWEEN 1900 AND 2023),
                         mobile CHAR(3) NOT NULL
);

-- 기본값 포함  userTBL 정의

DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL (
                         userID CHAR(8) NOT NULL PRIMARY KEY,
                         name VARCHAR(10) NOT NULL,
                         birthYear INT NOT NULL DEFAULT -1,
                         addr CHAR(2) NOT NULL DEFAULT '서울',
                         mobile1 CHAR(3),
                         mobile2 CHAR(8),
                         height SMALLINT DEFAULT 170,
                         mDate DATE
);

-- 요구 조건: mobile1 삭제  name → uName으로 변경 , 기본키 제거

-- 1. mobile1 삭제
ALTER TABLE userTBL DROP COLUMN mobile1;

-- 2. name → uName으로 변경
ALTER TABLE userTBL CHANGE name uName VARCHAR(10);

-- 3. 기본키 제거
ALTER TABLE userTBL DROP PRIMARY KEY;

USE employees;

-- 기존 부서 정보 삭제
DELETE FROM departments WHERE dept_no IN ('d001','d002','d003','d004','d005','d006','d007','d008');

-- 기존 직원 정보 삭제
DELETE FROM employees WHERE emp_no BETWEEN 10001 AND 10007;

-- 기존 부서 배치 정보 삭제
DELETE FROM dept_emp WHERE emp_no BETWEEN 10001 AND 10007;
INSERT INTO departments (dept_no, dept_name) VALUES
                                                 ('d001', 'Marketing'),
                                                 ('d002', 'Finance'),
                                                 ('d003', 'Human Resources'),
                                                 ('d004', 'Production'),
                                                 ('d005', 'Development'),
                                                 ('d006', 'Quality Management'),
                                                 ('d007', 'Sales'),
                                                 ('d008', 'Research');


INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES
    (10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26'),
    (10002, '1964-06-02', 'Bezalel', 'Simmel', 'F', '1985-11-21'),
    (10003, '1959-12-03', 'Parto', 'Bamford', 'M', '1986-08-28'),
    (10004, '1954-05-01', 'Christian', 'Koblick', 'M', '1986-12-01'),
    (10005, '1955-01-21', 'Kyoichi', 'Maliniak', 'M', '1989-09-12'),
    (10006, '1953-04-20', 'Anneke', 'Preusig', 'F', '1990-08-05'),
    (10007, '1957-05-23', 'Tzvetan', 'Zielinski', 'M', '1989-02-10');

-- ✅ 직원 부서 배치 정보 삽입
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date) VALUES
                                                               (10001, 'd005', '1986-06-26', '9999-01-01'),
                                                               (10002, 'd007', '1995-08-03', '9999-01-01'),
                                                               (10003, 'd004', '1995-12-03', '9999-01-01'),
                                                               (10004, 'd004', '1986-12-01', '9999-01-01'),
                                                               (10005, 'd003', '1989-09-12', '9999-01-01'),
                                                               (10006, 'd005', '1990-08-05', '9999-01-01'),
                                                               (10007, 'd008', '1989-02-10', '9999-01-01');
-- ✅ titles 테이블 데이터 추가
INSERT INTO titles (emp_no, title, from_date, to_date) VALUES
                                                           (10001, 'Senior Engineer', '1986-06-26', '9999-01-01'),
                                                           (10002, 'Senior Engineer', '1995-08-03', '9999-01-01'),
                                                           (10003, 'Senior Engineer', '1995-12-03', '9999-01-01'),
                                                           (10004, 'Engineer',        '1986-12-01', '9999-01-01'),
                                                           (10005, 'Senior Engineer', '1989-09-12', '9999-01-01'),
                                                           (10006, 'Staff',           '1990-08-05', '9999-01-01'),
                                                           (10007, 'Senior Staff',    '1989-02-10', '9999-01-01');

-- ✅ salaries 테이블 데이터 추가
INSERT INTO salaries (emp_no, salary, from_date, to_date) VALUES
                                                              (10001, 88958, '2002-06-22', '9999-01-01'),
                                                              (10002, 72527, '2001-08-06', '9999-01-01'),
                                                              (10003, 43101, '2000-12-15', '9999-01-01'),
                                                              (10004, 74057, '2001-11-27', '9999-01-01'),
                                                              (10005, 94692, '2001-09-25', '9999-01-01'),
                                                              (10006, 94409, '2001-09-05', '9999-01-01'),
                                                              (10007, 88070, '2002-02-07', '9999-01-01');



DROP VIEW IF EXISTS employees_info;
-- 다음 정보를 가지는 직원 정보를 출력하는 EMPLOYEES_INFO 뷰를 작성하세요
CREATE VIEW employees_info AS
SELECT
    e.emp_no,
    e.birth_date,
    e.first_name,
    e.last_name,
    e.gender,
    e.hire_date,
    t.title,
    t.from_date AS t_from,
    t.to_date AS t_to,
    s.salary,
    s.from_date AS s_from,
    s.to_date AS s_to
FROM employees e
         JOIN titles t ON e.emp_no = t.emp_no
         JOIN salaries s ON e.emp_no = s.emp_no;


-- EMPLOYEES_INFO 뷰에서 재직자의 현재 정보만 출력하세요.
SELECT * FROM employees_info
WHERE t_to = '9999-01-01'
  AND s_to = '9999-01-01';



-- 다음 정보를 가지는 부서 정보를 출력하는 EMP_DEPT_INFO 뷰를 작성하세요
CREATE VIEW emp_dept_info AS
SELECT
    e.emp_no,
    e.dept_no,
    dp.dept_name,
    e.from_date,
    e.to_date
FROM dept_emp e
         JOIN departments dp ON e.dept_no = dp.dept_no;


-- EMP_DEPT_INFO로 현재 재직자의 부서 정보를 출력하세요.

SELECT * FROM emp_dept_info
WHERE to_date = '9999-01-01';

