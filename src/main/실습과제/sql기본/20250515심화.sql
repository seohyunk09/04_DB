USE sqldb;

CREATE TABLE stdtbl (
                        stdName VARCHAR(10) NOT NULL PRIMARY KEY,
                        addr CHAR(4) NOT NULL
);

CREATE TABLE clubtbl (
                         clubName VARCHAR(10) NOT NULL PRIMARY KEY,
                         roomNo CHAR(4) NOT NULL
);

CREATE TABLE stdclubtbl (
                            num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
                            stdName VARCHAR(10) NOT NULL,
                            clubName VARCHAR(10) NOT NULL,
                            FOREIGN KEY(stdName) REFERENCES stdtbl(stdName),
                            FOREIGN KEY(clubName) REFERENCES clubtbl(clubName)
);
-- 학생
INSERT INTO stdtbl VALUES
                       ('김범수','경남'), ('성시경','서울'),
                       ('조용필','경기'), ('은지원','경북'), ('바비킴','서울');

-- 동아리
INSERT INTO clubtbl VALUES
                        ('수영','101호'), ('바둑','102호'),
                        ('축구','103호'), ('봉사','104호');

-- 가입 정보
INSERT INTO stdclubtbl VALUES
                           (NULL, '김범수','바둑'),
                           (NULL, '김범수','축구'),
                           (NULL, '조용필','축구'),
                           (NULL, '은지원','축구'),
                           (NULL, '은지원','봉사'),
                           (NULL, '바비킴','봉사');

-- 문제 1. 학생 기준: 이름, 지역, 가입 동아리, 동아리방 출력
SELECT s.stdName, s.addr, c.clubName, c.roomNo
FROM stdtbl s
         JOIN stdclubtbl sc ON s.stdName = sc.stdName
         JOIN clubtbl c ON sc.clubName = c.clubName;

--  문제 2. 동아리 기준: 동아리명, 동아리방, 학생명, 주소 출력

SELECT c.clubName, c.roomNo, s.stdName, s.addr
FROM clubtbl c
         JOIN stdclubtbl sc ON c.clubName = sc.clubName
         JOIN stdtbl s ON sc.stdName = s.stdName;

-- 우대리 연락처
SELECT
    e.emp AS 부하직원,
    e.manager AS 직속상관,
    m.empTel AS 직속상관연락처
FROM emptbl e
         LEFT JOIN emptbl m ON e.manager = m.emp
WHERE e.emp = '우대리';


-- 심화2

USE sqldb;
USE employees;
CREATE TABLE emptbl (
                        emp CHAR(3)  PRIMARY KEY,
                        manager CHAR(3),
                        empTel VARCHAR(8)
);


SELECT * FROM emptbl;

INSERT INTO emptbl VALUES('나사장', NULL, '0000');
INSERT INTO emptbl VALUES('김재무', '나사장', '2222');
INSERT INTO emptbl VALUES('김부장', '김재무', '2222-1');
INSERT INTO emptbl VALUES('이부장', '김재무', '2222-2');
INSERT INTO emptbl VALUES('우대리', '이부장', '2222-2-1');
INSERT INTO emptbl VALUES('지사원', '이부장', '2222-2-2');
INSERT INTO emptbl VALUES('이영업', '나사장', '1111');
INSERT INTO emptbl VALUES('한과장', '이영업', '1111-1');
INSERT INTO emptbl VALUES('최정보', '나사장', '3333');
INSERT INTO emptbl VALUES('윤차장', '최정보', '3333-1');
INSERT INTO emptbl VALUES('이주임', '윤차장', '3333-1-1');


-- 앞에서 추가한 테이블에서 '우대리'의 상관 연락처 정보를 확인하세요.○ 출력할 정보  부하직원, 직속상관, 직속상관연락처

SELECT
    e.emp AS 부하직원,
    e.manager AS 직속상관,
    m.empTel AS 직속상관연락처
FROM emptbl e
         LEFT JOIN empTbl m
                   ON e.manager = m.emp
WHERE e.emp = '우대리';

-- 중복 제거를 위해 전체 삭제
DELETE FROM emptbl
WHERE emp = '우대리';

-- 다시 1건만 입력
INSERT INTO emptbl VALUES('우대리', '이부장', '2222-2-1');

-- 현재 재직 중인 직원의 정보 출력 (이름 + 직책)
SELECT
    d.dept_no,
    d.dept_name,
    COUNT(*) AS 인원수
FROM departments d
         JOIN dept_emp de ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no, d.dept_name
ORDER BY d.dept_no;


-- 재직자 전체 정보 + 직책 + 급여

SELECT e.*, t.title, s.salary
FROM employees e
         JOIN titles t ON e.emp_no = t.emp_no
         JOIN salaries s ON e.emp_no = s.emp_no
WHERE t.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01';


-- 재직자 + 부서 이름 출력 (emp_no 오름차순)


SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
ORDER BY e.emp_no;


-- 부서별 재직 중인 직원 수 출력

SELECT d.dept_no, d.dept_name, COUNT(*) AS 인원수
FROM departments d
         JOIN dept_emp de ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no, d.dept_name
ORDER BY d.dept_no;

SELECT
    d.dept_no,
    d.dept_name,
    COUNT(*) AS 인원수
FROM departments d
         JOIN dept_emp de ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no, d.dept_name
ORDER BY d.dept_no;

-- 직원 10209번의 부서 이동 히스토리
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name, de.from_date, de.to_date
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d ON de.dept_no = d.dept_no
WHERE e.emp_no = 10209;
