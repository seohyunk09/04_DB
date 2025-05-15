
USE sqldb;
-- IF NULL() - SELECT 절에 사용
SELECT
    name, IFNULL(mobile1,'없음')
FROM
    usertbl;


SELECT
    CASE 10
        WHEN 1 THEN '일'
        WHEN 5 THEN '오'
        WHEN 10 THEN '십'
        END AS 'CASE 연습';


SELECT
    name,
    birthYear,
    CASE
        WHEN birthYear >= 1980 THEN '80년대생'
        WHEN birthYear >= 1970 THEN '70년대생'
        WHEN birthYear >= 1960 THEN '60년대생'
        ELSE '50년대생'
    END '몇년도생'


FROM usertbl;



/*여러 테이블 JOIN*/
USE sqldb;

SELECT *
FROM
    stdtbl S
INNER JOIN
        std
