-- 데이터베이스 선택 (없으면 생성 후 사용)
CREATE DATABASE IF NOT EXISTS sqldb;
USE sqldb;

-- 테이블 생성
CREATE TABLE tbl1 (
                      a INT PRIMARY KEY,
                      b INT,
                      c INT
);

SHOW INDEX FROM tbl1;

-- sqldb 데이터베이스 선택
USE sqldb;

-- 테이블 생성(tbl2)
CREATE TABLE tbl2 (
                      a INT PRIMARY KEY,
                      b INT UNIQUE,
                      c INT UNIQUE,
                      d INT
);

SHOW INDEX FROM tbl2;

-- 테이블 생성(tbl3)
USE sqldb;

CREATE TABLE tbl3 (
                      a INT UNIQUE,
                      b INT UNIQUE,
                      c INT UNIQUE,
                      d INT
);
SHOW INDEX FROM tbl3;
USE sqldb;
-- 테이블 생성(tbl4)
CREATE TABLE tbl4 (
                      a INT UNIQUE NOT NULL,
                      b INT UNIQUE,
                      c INT UNIQUE,
                      d INT
);


SHOW INDEX FROM tbl4;


-- 테이블 생성(tbl5)
USE sqldb;

CREATE TABLE tbl5 (
                      a INT UNIQUE NOT NULL,
                      b INT UNIQUE,
                      c INT UNIQUE,
                      d INT PRIMARY KEY
);

SHOW INDEX FROM tbl5;

-- testdb에 다음 컬럼 목록을 가지는 usertbl을 만드세요.
-- 데이터베이스 생성 및 선택
CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;

-- 테이블 생성
CREATE TABLE usertbl (
                         userID CHAR(8) NOT NULL PRIMARY KEY,
                         name VARCHAR(10) NOT NULL,
                         birthYear INT NOT NULL,
                         addr NCHAR(2) NOT NULL
);

-- 데이터 삽입 = 아래 데이터를 추가하고,
INSERT INTO usertbl VALUES
                        ('LSG', '이승기', 1987, '서울'),
                        ('KBS', '김범수', 1979, '경남'),
                        ('KKH', '김경호', 1971, '전남'),
                        ('JYP', '조용필', 1950, '경기'),
                        ('S나', '성시경', 1979, '서울');



-- 클러스터형 인덱스의 테이블 내용을 확인하세요.
SELECT * FROM usertbl;






-- ALTER를 사용하여 usertbl에서 PRIMARY KEY 제약조건을 제거하고, name 컬럼에 pk_name이라는 제약조건명으로 기본키를 설정하세요.

-- 1. 기존 PRIMARY KEY 제거
ALTER TABLE usertbl DROP PRIMARY KEY;

-- 2. name 컬럼에 pk_name이라는 이름으로 새로운 PRIMARY KEY 추가
ALTER TABLE usertbl ADD CONSTRAINT pk_name PRIMARY KEY (name);


-- usertbl의 내용을 출력하여, 새로운 클러스터형 인덱스를 확인하세요
SELECT * FROM usertbl;

-- 심화문제 스타트1!

-- sqldb에서 usertbl 테이블에서 다음 내용들을 확인하세요
-- 인덱스 목록 확인
SHOW INDEX FROM usertbl;


-- 데이터 크기와 인덱스 크기 확인

SELECT
    table_name,
    data_length,
    index_length
FROM
    information_schema.tables
WHERE
    table_schema = 'testdb' AND table_name = 'usertbl';

-- usertbl의 addr 컬럼에 대해 idx_usertbl_addr이름으로 인덱스를 만들고, 인덱스 목록을 확인하세요.
CREATE INDEX idx_usertbl_addr ON usertbl(addr);

SHOW INDEX FROM usertbl;



-- usertbl의 상태를 출력하여 인덱스의 내용이 만들어졌는지 확인하고, 내용이 없다면 실제 적용되도록 한 후, 인덱스의 크기를 확인하세요.
SELECT *
FROM information_schema.tables
WHERE table_schema = 'testdb' AND table_name = 'usertbl';




-- usertbl에 대해 다음을 처리하세요.
-- birthYear 칼럼에 대해 idx_usertbl_birthYear 이름의 인덱스 만들기 (에러가 난다면 그 이유를 설명하세요)
CREATE INDEX idx_usertbl_birthYear ON usertbl(birthYear);


-- name 칼럼에 대해 idx_usertbl_nam 이름의  unique 인덱스를 만드세요.

-- 기존 PRIMARY KEY 제거
ALTER TABLE usertbl DROP PRIMARY KEY;

-- name 컬럼에 UNIQUE 인덱스 생성
CREATE UNIQUE INDEX idx_usertbl_nam ON usertbl(name);


-- 생성된 인덱스의 목록을 확인하세요.
SHOW INDEX FROM usertbl;


-- usertbl에 대해 다음을 처리하시오.
-- name 컬럼에 대한 보조 인덱스 삭제하시오.
DROP INDEX idx_usertbl_nam ON usertbl;


-- name과 birthYear 컬럼 조합으로 idx_usertbl_name_birthYear 이름의 인덱스를 생성

CREATE INDEX idx_usertbl_name_birthYear ON usertbl(name, birthYear);

-- 인덱스의 목록을 확인하세요.

SHOW INDEX FROM usertbl;

-- usertbl에서 앞에서 만든 인덱스를 삭제하세요
DROP INDEX idx_usertbl_name_birthYear ON usertbl;


-- 다음과 같이 실습 데이터베이스 및 사용자를 생성하고, 해당 데이터베이스에 대해 모든 권한을 부여하세요.

-- 1. 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS scoula_db;

-- 2. 사용자 생성 (비밀번호 포함)
CREATE USER IF NOT EXISTS 'scoula'@'%' IDENTIFIED BY '1234';

-- 3. 권한 부여
GRANT ALL PRIVILEGES ON scoula_db.* TO 'scoula'@'%' WITH GRANT OPTION;

-- 4. 권한 적용
FLUSH PRIVILEGES;









