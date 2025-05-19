
-- tabledb 데이터베이스를 생성하세요
DROP DATABASE IF EXISTS tabledb;
CREATE DATABASE tabledb;
USE tabledb;

-- 다음 컬럼을 가지는 usertbl 테이블을 만드세요
CREATE TABLE usertbl (
                         userID CHAR(8) NOT NULL PRIMARY KEY,
                         name VARCHAR(10) NOT NULL,
                         birthyear INT NOT NULL,
                         addr CHAR(2) NOT NULL,
                         mobile1 CHAR(3),
                         mobile2 CHAR(8),
                         height SMALLINT,
                         mDate DATE
);

-- 다음 컬럼을 가지는 buytbl 테이블을 만드세요.

CREATE TABLE buytbl (
                        num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        userID CHAR(8) NOT NULL,
                        prodName CHAR(6) NOT NULL,
                        groupName CHAR(4),
                        price INT NOT NULL,
                        amount SMALLINT NOT NULL,
                        FOREIGN KEY (userID) REFERENCES usertbl(userID)
);
-- 회원 데이터 입력
INSERT INTO usertbl VALUES
                        ('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-08-08'),
                        ('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-04-04'),
                        ('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-07-07');

-- 구매 데이터 입력
INSERT INTO buytbl(userID, prodName, groupName, price, amount) VALUES
                                                                   ('KBS', '운동화', NULL, 30, 2),
                                                                   ('KBS', '노트북', '전자', 1000, 1);


DROP TABLE IF EXISTS prodTbl;
-- 다음 컬럼을 가지는 prodTbl 을 정의하세요
CREATE TABLE prodTbl (
                         prodCode CHAR(3) NOT NULL,
                         prodID CHAR(4) NOT NULL,
                         prodDate DATETIME NOT NULL,
                         proCur CHAR(10),
                         PRIMARY KEY (prodCode, prodID)
);
-- usertbl과 buytbl을 바탕으로 다음 결과가 나오는 뷰를 정의하세요.
CREATE VIEW user_buy_view AS
SELECT
    u.userID,
    u.name,
    b.prodName,
    u.addr,
    CONCAT(u.mobile1, u.mobile2) AS 연락처
FROM usertbl u
         JOIN buytbl b
              ON u.userID = b.userID;

-- 위에서 정의한 뷰에서 userid가 '김범수'인 데이터만 출력하세요.

SELECT * FROM user_buy_view WHERE name = '김범수';

