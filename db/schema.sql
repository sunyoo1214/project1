# DB 생성
DROP DATABASE IF EXISTS sb_c_2022;
CREATE DATABASE sb_c_2022;
USE sb_c_2022;

# 게시물 테이블 생성
CREATE TABLE article (
id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
regDate DATETIME NOT NULL,
updateDate DATETIME NOT NULL,
title CHAR(100) NOT NULL,
`body` TEXT NOT NULL
);

# 게시물, 테스트 데이터 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body`= '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body`= '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body`= '내용3';

# 회원 테이블 생성
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(20) NOT NULL,
    authLevel SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한레벨(3=일반, 7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL,
    cellphoneNo CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴여부(0=탈퇴전, 1=탈퇴)',
    delDate DATETIME COMMENT '탈퇴날짜'
);

# 회원, 테스트 데이터 생성(관리자 회원)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
authLevel = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNo = '01011111111',
email = 'sunyoo1214@gmail.com';

# 회원, 테스트 데이터 생성(일반 회원)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user1',
loginPw = 'user1',
`name` = '사용자1',
nickname = '사용자1',
cellphoneNo = '01011111111',
email = 'bigi0511@naver.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user2',
loginPw = 'user2',
`name` = '사용자2',
nickname = '사용자2',
cellphoneNo = '01011111111',
email = 'lovely1214@naver.com';

# 테이블 속 칼럼과 데이터 확인
SELECT * FROM `member`;

# 게시물 테이블에 회원정보 추가
ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER `updateDate`;

# 테이블 속 칼럼과 데이터 확인
SELECT * FROM `article`;

# 기존 게시물의 작성자를 2번으로 지정
UPDATE article
SET memberId = 2
WHERE memberId = 0;

# 게시판 테이블 생성
create table board (
    id int(10) unsigned not null primary key AUTO_INCREMENT, 
    regDate datetime not null, 
    updateDate DateTime not null, 
    `code` char(50) not null unique comment 'notice(공지사항), free1(자유게시판1), free2(자유게시판2),...', 
    `name` char(50) not null unique comment '게시판 이름', 
    delStatus tinyint(1) unsigned not null default 0 comment '삭제여부(0=탈퇴전, 1=탈퇴)', 
    delDate datetime comment '삭제날짜'
);

select * from board;

# 기본 게시판 생성
insert into board
set regDate = now(),
updateDate = now(),
`code` = 'notice', 
`name` = '공지사항';

insert into board
set regDate = now(),
updateDate = now(),
`code` = 'free1', 
`name` = '자유';

select * from article;

# 게시판 테이블에 boardId 칼럼 추가
alter table article add column boardId int(10) unsigned not null after memberId;

# 1, 2번 게시물을 공지사항 게시물로 지정
update article
set boardId = 1
where id in (1, 2);

# 3번 게시물을 자유게시판 게시물로 지정
update article
set boardId = 2
where id in (3);











