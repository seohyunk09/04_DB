-- 현재 서버에 존재 하는 데이터베이스 확인
SHOW DATABASES;

-- 현재 데이터베이스를 employees로 설정
USE employees;

-- employees 데이터베이스의 테이블 목록 보기
SHOW TABLES;

-- 특정 테이블의 열(컬럼) 목록 보기
DESCRIBE employees;

-- titles 테이블의 데이터 출력
SELECT * FROM titles;

-- first_name 컬럼만 출력
SELECT first_name FROM employees;

-- first_name, last_name, gender 컬럼 출력
SELECT first_name, last_name, gender FROM employees;

USE employees;

SELECT
    first_name AS '이름',
    gender AS '성별',
    hire_date AS '회사 입사일'
FROM
    employees.employees;

USE sqlDB;

-- usertbl 테이블에서 이름이 '김경호'인 행
SELECT * FROM usertbl WHERE name = '김경호';

-- 생년 1970 이상 AND 키 182 이상
SELECT * FROM usertbl WHERE birthYear >= 1970 AND height >= 182;

-- 키가 180~183 사이인 데이터
SELECT * FROM usertbl WHERE height BETWEEN 180 AND 183;

-- 주소가 경남, 전남, 경북
SELECT * FROM usertbl WHERE addr IN ('경남', '전남', '경북');


-- 이름이 '김'으로 시작하는 데이터
SELECT * FROM usertbl WHERE name LIKE '김%';

-- 김경호보다 큰 사람(키)들의 이름과 키
SELECT name, height
FROM usertbl
WHERE height > (
    SELECT height FROM usertbl WHERE name = '김경호'
);

-- usertbl을 mdata의 오름 차순으로 정렬하여 출력하세요

SELECT * FROM usertbl ORDER BY mdate ASC;

-- usertbl을 mdata의 내림 차순으로 정렬하여 출력하세요.


SELECT * FROM usertbl ORDER BY mdate DESC;

-- usertbl을 height의 내림차순으로 정렬하고, 동률인 경우 name의 내림차순으로 정렬하여 출력하세요.
SELECT * FROM usertbl ORDER BY height DESC, name DESC;



-- usertbl의 주소지를 중복없이 오름 차순으로 출력하세요.

SELECT DISTINCT addr FROM usertbl ORDER BY addr ASC;


-- World 데이터베이스에서 다음 질문을 처리하세요.
USE world;
-- ○ 국가 코드가 'KOR'인 도시를 찾아 인구수를 역순으로 표시하세요.

SELECT * FROM city WHERE CountryCode = 'KOR' ORDER BY Population DESC;

-- ○ city 테이블에서 국가코드와 인구수를 출력하라. 정렬은 국가코드별로 오름차순으로, 동일한 코드(국가) 안에서는 인구 수의 역순으로 표시하세요.

SELECT CountryCode, Population FROM city ORDER BY CountryCode ASC, Population DESC;

-- ○ city 테이블에서 국가코드가 'KOR'인 도시의 수를 표시하세요.
SELECT COUNT(*) FROM city WHERE CountryCode = 'KOR';


-- ○ city 테이블에서 국가코드가 'KOR', 'CHN', 'JPN'인 도시를 찾으세요.

SELECT * FROM city WHERE CountryCode IN ('KOR', 'CHN', 'JPN');

-- ○ 국가코드가 'KOR'이면서 인구가 100만 이상인 도시를 찾으세요.

SELECT * FROM city WHERE CountryCode = 'KOR' AND Population >= 1000000;

-- ○ 국가 코드가 'KOR'인 도시 중 인구수가 많은 순서로 상위 10개만 표시하세요.

SELECT * FROM city WHERE CountryCode = 'KOR' ORDER BY Population DESC LIMIT 10;

-- ○ city 테이블에서 국가코드가 'KOR'이고, 인구가 100만 이상 500만 이하인 도시를 찾으세요
SELECT * FROM city WHERE CountryCode = 'KOR' AND Population BETWEEN 1000000 AND 5000000;











