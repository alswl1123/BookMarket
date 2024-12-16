CREATE table MEMBER (
id VARCHAR(10) NOT NULL,    -- 회원 아이디
pw VARCHAR(10) NOT NULL,    -- 비밀번호
name VARCHAR(10) NOT NULL,  -- 이름
gender VARCHAR(4),          -- 성별
birth VARCHAR(10),          -- 생일
mail VARCHAR(30),           -- 메일
phone VARCHAR(20),          -- 전화번호
address VARCHAR(90),        -- 주소
regist_day VARCHAR(50),     -- 가입 일차
PRIMARY KEY(ID)             -- 회원 아이디를 고유 키로 설정
) default CHARSET=utf8;