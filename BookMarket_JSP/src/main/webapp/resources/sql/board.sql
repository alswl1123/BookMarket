CREATE TABLE board (
num INT NOT NULL AUTO_INCREMENT, -- 게시글 순번
id VARCHAR(10) NOT NULL,         -- 회원 아이디
name VARCHAR(10) NOT NULL,       -- 회원 이름
subject VARCHAR(100) NOT NULL,   -- 게시글 제목
content TEXT NOT NULL,           -- 게시글 내용
regist_day VARCHAR(30),          -- 게시글 등록 일자
hit INT,                         -- 게시글 조회 수
ip VARCHAR(20),                  -- 게시글 등록 시 IP
PRIMARY KEY (num)                -- 게시글 순번을 고유 키로 설정
) default CHARSET=utf8;

SELECT * FROM board;