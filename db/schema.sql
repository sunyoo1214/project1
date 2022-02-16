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
create table `member` (
    id int(10) unsigned not null primary key auto_increment,
    regDate datetime not null,
    updateDate datetime not null,
    loginId char(20) not null,
    loginPw char(20) not null,
    authLevel smallint(2) unsigned default 3 comment '권한레벨(3=일반, 7=관리자)',
    `name` char(20) not null,
    nickname char(20) not null,
    cellphoneNo char(20) not null,
    email char(50) not null,
    delStatus tinyint(1) unsigned not null default 0 comment '탈퇴여부(0=탈퇴전, 1=탈퇴)',
    delDate DATETIMe comment '탈퇴날짜'
);

# 회원, 테스트 데이터 생성(관리자 회원)
insert into `member`
set regDate = now(),
updateDate = now(),
loginId = 'admin',
loginPw = 'admin',
authLevel = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNo = '01011111111',
email = 'sunyoo1214@gmail.com';

# 회원, 테스트 데이터 생성(일반 회원)
insert into `member`
set regDate = now(),
updateDate = now(),
loginId = 'user1',
loginPw = 'user1',
`name` = '사용자1',
nickname = '사용자1',
cellphoneNo = '01011111111',
email = 'bigi0511@naver.com';

insert into `member`
set regDate = now(),
updateDate = now(),
loginId = 'user2',
loginPw = 'user2',
`name` = '사용자2',
nickname = '사용자2',
cellphoneNo = '01011111111',
email = 'lovely1214@naver.com';

select * from `member`