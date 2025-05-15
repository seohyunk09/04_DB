-- 현재 서버에 존재 하는 데이터베이스 확인
SHOW DATABASES;

USE sqldb;
SELECT
    userid AS '사용자 아이디',
    COUNT(*) AS '총 구매 개수'
FROM
    buytbl
GROUP BY
    userid;
SELECT
    userid AS '사용자 아이디',
    SUM(amount * price) AS '총 구매액'
FROM
    buytbl
GROUP BY
    userid;
SELECT
    AVG(amount) AS '평균 구매 개수'
FROM
    buytbl;

SELECT
    userid AS userID,
    AVG(amount) AS '평균 구매 개수'
FROM
    buytbl
GROUP BY
    userid;

SELECT name, height
FROM usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
   OR height = (SELECT MIN(height) FROM usertbl);

SELECT
    COUNT(*) AS '휴대폰이 있는 사용자'
FROM
    usertbl
WHERE
    mobile1 IS NOT NULL AND mobile1 != ''
  AND mobile2 IS NOT NULL AND mobile2 != '';

SELECT
    userid AS '사용자',
    SUM(amount * price) AS '총 구매액'
FROM
    buytbl
GROUP BY
    userid;
SELECT
    userid AS '사용자',
    SUM(amount * price) AS '총 구매액'
FROM
    buytbl
GROUP BY
    userid
HAVING
    SUM(amount * price) >= 1000;

USE world;
SELECT
    SUM(Population) AS '총합'
FROM
    city
WHERE
    CountryCode = 'KOR';
SELECT
    MIN(Population) AS '최소값'
FROM
    city
WHERE
    CountryCode = 'KOR';
SELECT
    AVG(Population) AS '평균'
FROM
    city
WHERE
    CountryCode = 'KOR';

SELECT
    MAX(Population) AS '최대값'
FROM
    city
WHERE
    CountryCode = 'KOR';

SELECT
    Name,
    CHAR_LENGTH(Name) AS '글자수'
FROM
    country;
SELECT
    UPPER(LEFT(Name, 3)) AS '앞 세글자 대문자'
FROM
    country;

-- 기대수명 소수점 첫째자리 반올림
SELECT
    ROUND(LifeExpectancy, 1) AS '기대수명(반올림)'
FROM
    country;

USE employees;
-- 1. 각 부서별 현 관리자 정보 출력 (to_date = '9999-01-01')
SELECT
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.first_name,
    e.last_name
FROM
    dept_manager dm
        JOIN departments d ON dm.dept_no = d.dept_no
        JOIN employees e ON dm.emp_no = e.emp_no
WHERE
    dm.to_date = '9999-01-01';

-- 2. 부서번호 'd005'의 현재 관리자 정보 출력
SELECT
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.first_name,
    e.last_name
FROM
    dept_manager dm
        JOIN departments d ON dm.dept_no = d.dept_no
        JOIN employees e ON dm.emp_no = e.emp_no
WHERE
    dm.to_date = '9999-01-01'
  AND dm.dept_no = 'd005';

-- 3. employees 테이블에서 입사일 기준 내림차순 정렬 후 8페이지 (20명씩)
SELECT *
FROM employees
ORDER BY hire_date DESC
LIMIT 20 OFFSET 140;  -- (8페이지 - 1) * 20 = 140

-- 4. 재직자의 총 수 구하기
SELECT
    COUNT(*) AS 재직자수
FROM
    dept_emp
WHERE
    to_date = '9999-01-01';

-- 5. 재직자의 평균 급여
SELECT
    ROUND(AVG(s.salary), 2) AS 평균급여
FROM
    salaries s
WHERE
    s.to_date = '9999-01-01';

-- 6. 재직자 평균 급여보다 높은 급여 받는 재직자
SELECT
    s.emp_no,
    s.salary
FROM
    salaries s
WHERE
    s.to_date = '9999-01-01'
  AND s.salary > (
    SELECT
        AVG(salary)
    FROM
        salaries
    WHERE
        to_date = '9999-01-01'
);

-- 7. 부서별 재직자의 수 (to_date = '9999-01-01')

SELECT
    dept_no,
    COUNT(*) AS 재직자수
FROM
    dept_emp
WHERE
    to_date = '9999-01-01'
GROUP BY
    dept_no
ORDER BY
    dept_no ASC;
-- 부서 전체 보기
SELECT * FROM departments;

-- 관리자 테이블에서 현재 재직자만 보기
SELECT * FROM dept_manager WHERE to_date = '9999-01-01';
SELECT * FROM dept_manager;

