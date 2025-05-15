USE sqldb;

SELECT *
FROM usertbl u
         JOIN buytbl b ON u.userID = b.userID;

USE shopdb;
-- 문제: 사용자별 구매 이력을 출력하세요 (구매이력 없는 사람도 포함)
SELECT u.userID, u.name, p.prodName, u.addr, u.tel
FROM sqldb.userTBL u
         LEFT JOIN sqldb.buyTBL b ON u.userID = b.userID
         LEFT JOIN shopdb.productTBL p ON b.prodName = p.prodName
ORDER BY u.userID;
-- 문제:2. 위 결과에서 userID가 'JYP'인 데이터만 출력
USE sqldb;

SELECT *
FROM usertbl u
         JOIN buytbl b ON u.userID = b.userID
WHERE u.userID = 'JYP';


-- 문제: 전화번호가 없는 사용자만 출력하세요
USE sqldb;
SELECT *
FROM usertbl
WHERE mobile1 IS NULL;




-- 3. 구매 이력이 없는 사용자도 포함해서 전체 구매 내역 출력 (LEFT JOIN)
USE shopdb;

SELECT u.userID, u.name, p.prodName, u.addr, u.mobile1 AS 연락처
FROM usertbl u
         LEFT JOIN buytbl b ON u.userID = b.userID
         LEFT JOIN shopdb.producttbl p ON b.prodName = p.prodName
ORDER BY u.userID;

-- 4. 전화번호가 없는 사람은 제외하고 사용자 조회
USE sqldb;

SELECT u.userID, u.name, p.prodName, u.addr, u.tel AS 연락처
FROM sqldb.userTBL u
         LEFT JOIN sqldb.buyTBL b ON u.userID = b.userID
         LEFT JOIN shopdb.productTBL p ON b.prodName = p.prodName
ORDER BY u.userID;

SELECT *
FROM userTBL
WHERE usertbl.mobile1 IS NOT NULL;



-- 문제: 현재 재직 중인 직원의 정보를 출력하세요
USE employees;
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
ORDER BY e.emp_no;
