
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- Member Table Create SQL
CREATE TABLE Member
(
    member_no             NUMBER            NOT NULL, 
    member_id             VARCHAR2(30)      UNIQUE NOT NULL, 
    member_pw             VARCHAR2(100)     NOT NULL, 
    member_name           VARCHAR2(20)      NOT NULL, 
    member_nick           VARCHAR2(40)      UNIQUE NOT NULL, 
    zip                   VARCHAR2(10)      NOT NULL, 
    road_addr             VARCHAR2(200)     NOT NULL, 
    det_addr              VARCHAR2(200)     NOT NULL, 
    card                  VARCHAR2(20)      UNIQUE NULL, 
    enroll_date           VARCHAR2(20)      NOT NULL, 
    member_level          NUMBER            NOT NULL, 
    gender                CHAR(1)           NOT NULL, 
    age                   NUMBER            NOT NULL, 
    member_profile        VARCHAR2(1000)    NULL, 
    email                 VARCHAR2(200)     NOT NULL, 
    expire_date           DATE              NULL, 
    phone                 VARCHAR2(20)      NOT NULL, 
    email_verification    NUMBER            NOT NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (member_no)
)
/

CREATE SEQUENCE Member_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER Member_AI_TRG
BEFORE INSERT ON Member 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Member_SEQ.NEXTVAL
    INTO :NEW.member_no
    FROM DUAL;
END;
/

--DROP TRIGGER Member_AI_TRG;
/

--DROP SEQUENCE Member_SEQ;
/

COMMENT ON COLUMN Member.member_no IS '회원번호'
/

COMMENT ON COLUMN Member.member_id IS '회원아이디'
/

COMMENT ON COLUMN Member.member_pw IS '비밀번호'
/

COMMENT ON COLUMN Member.member_name IS '회원 이름'
/

COMMENT ON COLUMN Member.member_nick IS '닉네임'
/

COMMENT ON COLUMN Member.zip IS '주소(우편번호)'
/

COMMENT ON COLUMN Member.road_addr IS '도로명'
/

COMMENT ON COLUMN Member.det_addr IS '상세주소'
/

COMMENT ON COLUMN Member.card IS '카드키'
/

COMMENT ON COLUMN Member.enroll_date IS '가입일'
/

COMMENT ON COLUMN Member.member_level IS '회원레벨'
/

COMMENT ON COLUMN Member.gender IS '성별'
/

COMMENT ON COLUMN Member.age IS '나이'
/

COMMENT ON COLUMN Member.member_profile IS '프로필 이미지(파일경로)'
/

COMMENT ON COLUMN Member.email IS '이메일'
/

COMMENT ON COLUMN Member.expire_date IS '이용권 만기일'
/

COMMENT ON COLUMN Member.phone IS '전화번호'
/

COMMENT ON COLUMN Member.email_verification IS '이메일 인증'
/

CREATE TABLE Meeting_Schedule
(
    meeting_seq     NUMBER          NOT NULL, 
    name            VARCHAR2(20)    NOT NULL, 
    phone           VARCHAR2(20)    NOT NULL, 
    email           VARCHAR2(20)    NULL, 
    response_fin    NUMBER          NOT NULL, 
    CONSTRAINT MEETING_SCHEDULE_PK PRIMARY KEY (meeting_seq)
)
/

CREATE SEQUENCE Meeting_Schedule_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER Meeting_Schedule_AI_TRG
BEFORE INSERT ON Meeting_Schedule 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Meeting_Schedule_SEQ.NEXTVAL
    INTO :NEW.meeting_seq
    FROM DUAL;
END;
/

--DROP TRIGGER Meeting_Schedule_AI_TRG;
/

--DROP SEQUENCE Meeting_Schedule_SEQ;
/

COMMENT ON TABLE Meeting_Schedule IS '상담신청'
/

COMMENT ON COLUMN Meeting_Schedule.meeting_seq IS '상담 시퀀스'
/

COMMENT ON COLUMN Meeting_Schedule.name IS '이름'
/

COMMENT ON COLUMN Meeting_Schedule.phone IS '연락처'
/

COMMENT ON COLUMN Meeting_Schedule.email IS '이메일'
/

COMMENT ON COLUMN Meeting_Schedule.response_fin IS '연락여부'
/


-- Member Table Create SQL
CREATE TABLE PRODUCT
(
    pno          NUMBER            NOT NULL, 
    pname        VARCHAR2(100)     NOT NULL, 
    pcontent     VARCHAR2(2000)    NOT NULL, 
    price        NUMBER            NOT NULL, 
    stock        NUMBER            NOT NULL, 
    category     NUMBER            NOT NULL, 
    category2    NUMBER            NOT NULL, 
    category3    NUMBER            NOT NULL, 
    thumbnail    VARCHAR2(200)     NOT NULL,
    CONSTRAINT PRODUCT_PK PRIMARY KEY (pno)
)
/

CREATE SEQUENCE PRODUCT_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER PRODUCT_AI_TRG
BEFORE INSERT ON PRODUCT 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT PRODUCT_SEQ.NEXTVAL
    INTO :NEW.pno
    FROM DUAL;
END;
/

--DROP TRIGGER PRODUCT_AI_TRG;
/

--DROP SEQUENCE PRODUCT_SEQ;
/

COMMENT ON TABLE PRODUCT IS '상품정보'
/

COMMENT ON COLUMN PRODUCT.pno IS '상품넘버'
/

COMMENT ON COLUMN PRODUCT.pname IS '상품이름'
/

COMMENT ON COLUMN PRODUCT.pcontent IS '상품설명'
/

COMMENT ON COLUMN PRODUCT.price IS '상품가격'
/

COMMENT ON COLUMN PRODUCT.stock IS '상품수량'
/

COMMENT ON COLUMN PRODUCT.category IS '카테고리'
/

COMMENT ON COLUMN PRODUCT.category2 IS '카테고리2'
/

COMMENT ON COLUMN PRODUCT.category3 IS '카테고리3'
/


-- Member Table Create SQL
CREATE TABLE Professional_category
(
    Category_no      NUMBER          NOT NULL, 
    Category_name    VARCHAR2(40)    NULL, 
    CONSTRAINT PROFESSIONAL_CATEGORY_PK PRIMARY KEY (Category_no)
)
/

CREATE SEQUENCE Professional_category_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER Professional_category_AI_TRG
BEFORE INSERT ON Professional_category 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Professional_category_SEQ.NEXTVAL
    INTO :NEW.Category_no
    FROM DUAL;
END;
/

--DROP TRIGGER Professional_category_AI_TRG;
/

--DROP SEQUENCE Professional_category_SEQ;
/

COMMENT ON TABLE Professional_category IS '특징 테이블'
/

COMMENT ON COLUMN Professional_category.Category_no IS '특기 번호'
/

COMMENT ON COLUMN Professional_category.Category_name IS '특기 이름'
/

-- Member Table Create SQL
CREATE TABLE Nutrition_table
(
    food_name    VARCHAR2(40)    UNIQUE NOT NULL, 
    kcal         NUMBER          NOT NULL, 
    CONSTRAINT NUTRITION_TABLE_PK PRIMARY KEY (food_name, kcal)
)
/

COMMENT ON TABLE Nutrition_table IS '음식 목록'
/

COMMENT ON COLUMN Nutrition_table.food_name IS '음식 이름'
/

COMMENT ON COLUMN Nutrition_table.kcal IS '칼로리'
/


-- Member Table Create SQL
CREATE TABLE Eat_log
(
    menu_no      NUMBER          NOT NULL, 
    food_name    VARCHAR2(40)    NOT NULL, 
    eat_date     VARCHAR2(20)    NOT NULL, 
    eat_time     VARCHAR2(20)    NOT NULL, 
    member_no    NUMBER          NOT NULL, 
    kcal         NUMBER          NOT NULL, 
    CONSTRAINT EAT_LOG_PK PRIMARY KEY (menu_no)
)
/

CREATE SEQUENCE Eat_log_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER Eat_log_AI_TRG
BEFORE INSERT ON Eat_log 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Eat_log_SEQ.NEXTVAL
    INTO :NEW.menu_no
    FROM DUAL;
END;
/

--DROP TRIGGER Eat_log_AI_TRG;
/

--DROP SEQUENCE Eat_log_SEQ;
/

COMMENT ON TABLE Eat_log IS '음식 섭취 테이블'
/

COMMENT ON COLUMN Eat_log.menu_no IS '식단번호'
/

COMMENT ON COLUMN Eat_log.food_name IS '식품명'
/

COMMENT ON COLUMN Eat_log.eat_date IS '식사날짜'
/

COMMENT ON COLUMN Eat_log.eat_time IS '식사시간'
/

COMMENT ON COLUMN Eat_log.member_no IS '회원번호'
/

COMMENT ON COLUMN Eat_log.kcal IS '칼로리'
/

ALTER TABLE Eat_log
    ADD CONSTRAINT FK_Eat_log_member_no_Member_me FOREIGN KEY (member_no)
        REFERENCES Member (member_no)
	on delete cascade
/

ALTER TABLE Eat_log
    ADD CONSTRAINT FK_Eat_log_food_name_Nutrition FOREIGN KEY (food_name)
        REFERENCES Nutrition_table (food_name)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE Report_Cat
(
    report_no    NUMBER           NOT NULL, 
    report_cat    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT REPORT_CAT_PK PRIMARY KEY (report_no)
)
/

CREATE SEQUENCE Report_Cat_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER Report_Cat_AI_TRG
BEFORE INSERT ON Report_Cat 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Report_Cat_SEQ.NEXTVAL
    INTO :NEW.report_no
    FROM DUAL;
END;
/

--DROP TRIGGER Report_Cat_AI_TRG;
/

--DROP SEQUENCE Report_Cat_SEQ;
/

COMMENT ON TABLE Report_Cat IS '신고 시유'
/

COMMENT ON COLUMN Report_Cat.report_no IS '신고 시퀀스'
/

COMMENT ON COLUMN Report_Cat.report_cat IS '신고 사유'
/


-- Member Table Create SQL
CREATE TABLE Trainer
(
    member_no        NUMBER            NOT NULL, 
    trainer_intro    VARCHAR2(2000)    NOT NULL, 
    cat_first        NUMBER            NOT NULL, 
    cat_second       NUMBER            NOT NULL, 
    cat_third        NUMBER            NOT NULL, 
    CONSTRAINT TRAINER_PK PRIMARY KEY (member_no)
)
/

COMMENT ON TABLE Trainer IS '트레이너 정보 입력'
/

COMMENT ON COLUMN Trainer.member_no IS '회원번호'
/

COMMENT ON COLUMN Trainer.trainer_intro IS '자기소개'
/

COMMENT ON COLUMN Trainer.cat_first IS '주특기1'
/

COMMENT ON COLUMN Trainer.cat_second IS '주특기2'
/

COMMENT ON COLUMN Trainer.cat_third IS '주특기3'
/

ALTER TABLE Trainer
    ADD CONSTRAINT FK_Trainer_member_no_Member_me FOREIGN KEY (member_no)
        REFERENCES Member (member_no)
	on delete cascade
/

ALTER TABLE Trainer
    ADD CONSTRAINT FK_Trainer_cat_first_Professio FOREIGN KEY (cat_first)
        REFERENCES Professional_category (Category_no)
	on delete cascade
/

ALTER TABLE Trainer
    ADD CONSTRAINT FK_Trainer_cat_second_Professi FOREIGN KEY (cat_second)
        REFERENCES Professional_category (Category_no)
	on delete cascade
/

ALTER TABLE Trainer
    ADD CONSTRAINT FK_Trainer_cat_third_Professio FOREIGN KEY (cat_third)
        REFERENCES Professional_category (Category_no)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE BASKET
(
    member_no    NUMBER    NOT NULL, 
    pno          NUMBER    NOT NULL, 
    stock        NUMBER    NOT NULL
)
/

COMMENT ON TABLE BASKET IS '장바구니'
/

COMMENT ON COLUMN BASKET.member_no IS '멤버넘버'
/

COMMENT ON COLUMN BASKET.pno IS '상품넘버'
/

COMMENT ON COLUMN BASKET.stock IS '수량'
/

ALTER TABLE BASKET
    ADD CONSTRAINT FK_BASKET_member_no_Member_mem FOREIGN KEY (member_no)
        REFERENCES Member (member_no)
	on delete cascade
/

ALTER TABLE BASKET
    ADD CONSTRAINT FK_BASKET_pno_PRODUCT_pno FOREIGN KEY (pno)
        REFERENCES PRODUCT (pno)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE NOTICE
(
    notice_no          NUMBER            NOT NULL, 
    notice_title       VARCHAR2(200)     NOT NULL, 
    notice_content     VARCHAR2(4000)    NOT NULL, 
    notice_date        VARCHAR2(20)      NOT NULL, 
    notice_filename    VARCHAR2(1000)     NOT NULL, 
    CONSTRAINT NOTICE_PK PRIMARY KEY (notice_no)
)
/

CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER NOTICE_AI_TRG
BEFORE INSERT ON NOTICE 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT NOTICE_SEQ.NEXTVAL
    INTO :NEW.notice_no
    FROM DUAL;
END;
/

--DROP TRIGGER NOTICE_AI_TRG;
/

--DROP SEQUENCE NOTICE_SEQ;
/

COMMENT ON TABLE NOTICE IS '공지사항'
/

COMMENT ON COLUMN NOTICE.notice_no IS '공지사항번호'
/

COMMENT ON COLUMN NOTICE.notice_title IS '글제목'
/

COMMENT ON COLUMN NOTICE.notice_content IS '글내용'
/

COMMENT ON COLUMN NOTICE.notice_date IS '작성날짜'
/

COMMENT ON COLUMN NOTICE.notice_filename IS '파일이름'
/


-- Member Table Create SQL
CREATE TABLE BOARD
(
    board_type	NUMBER	          NOT NULL,
    board_no          NUMBER           NOT NULL, 
    board_writer      NUMBER           NOT NULL, 
    board_title       VARCHAR2(1000)     NOT NULL, 
    board_content     VARCHAR2(4000)     NOT NULL, 
    board_date        VARCHAR2(20)     NOT NULL, 
    board_filename    VARCHAR2(1000)    NOT NULL, 
    report            NUMBER           NOT NULL, 
    CONSTRAINT BOARD_PK PRIMARY KEY (board_no)
)
/

CREATE SEQUENCE BOARD_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER BOARD_AI_TRG
BEFORE INSERT ON BOARD 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT BOARD_SEQ.NEXTVAL
    INTO :NEW.board_no
    FROM DUAL;
END;
/

--DROP TRIGGER BOARD_AI_TRG;
/

--DROP SEQUENCE BOARD_SEQ;
/

COMMENT ON TABLE BOARD IS '자유게시판'
/

COMMENT ON COLUMN BOARD.board_no IS '자유게시판번호'
/

COMMENT ON COLUMN BOARD.board_writer IS '작성자'
/

COMMENT ON COLUMN BOARD.board_title IS '글제목'
/

COMMENT ON COLUMN BOARD.board_content IS '글내용'
/

COMMENT ON COLUMN BOARD.board_date IS '작성날짜'
/

COMMENT ON COLUMN BOARD.board_filename IS '파일이름'
/

COMMENT ON COLUMN BOARD.report IS '조회수'
/

ALTER TABLE BOARD
    ADD CONSTRAINT FK_BOARD_board_writer_Member_m FOREIGN KEY (board_writer)
        REFERENCES Member (member_no)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE BOARD_COMMENT
(
    comment_no         NUMBER            NOT NULL, 
    comment_writer     NUMBER            NOT NULL, 
    comment_content    VARCHAR2(2000)    NOT NULL, 
    comment_date       VARCHAR2(20)      NOT NULL, 
    comment_level      NUMBER            NOT NULL, 
    ref                NUMBER            NOT NULL, 
    comment_ref        NUMBER            NOT NULL, 
    CONSTRAINT BOARD_COMMENT_PK PRIMARY KEY (comment_no)
)
/

CREATE SEQUENCE BOARD_COMMENT_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER BOARD_COMMENT_AI_TRG
BEFORE INSERT ON BOARD_COMMENT 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT BOARD_COMMENT_SEQ.NEXTVAL
    INTO :NEW.comment_no
    FROM DUAL;
END;
/

--DROP TRIGGER BOARD_COMMENT_AI_TRG;
/

--DROP SEQUENCE BOARD_COMMENT_SEQ;
/

COMMENT ON TABLE BOARD_COMMENT IS '자유게시판 댓글'
/

COMMENT ON COLUMN BOARD_COMMENT.comment_no IS '댓글 번호'
/

COMMENT ON COLUMN BOARD_COMMENT.comment_writer IS '작성자'
/

COMMENT ON COLUMN BOARD_COMMENT.comment_content IS '글내용'
/

COMMENT ON COLUMN BOARD_COMMENT.comment_date IS '작성날짜'
/

COMMENT ON COLUMN BOARD_COMMENT.comment_level IS '게시판레벨'
/

COMMENT ON COLUMN BOARD_COMMENT.ref IS '게시물번호'
/

COMMENT ON COLUMN BOARD_COMMENT.comment_ref IS '댓글 번호'
/

ALTER TABLE BOARD_COMMENT
    ADD CONSTRAINT FK_BOARD_COMMENT_comment_write FOREIGN KEY (comment_writer)
        REFERENCES Member (member_no)
	on delete cascade
/

ALTER TABLE BOARD_COMMENT
    ADD CONSTRAINT FK_BOARD_COMMENT_comment_ref_B FOREIGN KEY (comment_ref)
        REFERENCES BOARD_COMMENT (comment_no)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE PURCHASE
(
    member_no    NUMBER           NOT NULL, 
    pno          NUMBER           NOT NULL, 
    stock        NUMBER           NOT NULL, 
    buy_no       NUMBER           NOT NULL, 
    buy_date     VARCHAR2(20)     NOT NULL, 
    buy_addr     VARCHAR2(300)    NOT NULL
)
/

COMMENT ON TABLE PURCHASE IS '결제테이블'
/

COMMENT ON COLUMN PURCHASE.member_no IS '멤버넘버'
/

COMMENT ON COLUMN PURCHASE.pno IS '상품넘버'
/

COMMENT ON COLUMN PURCHASE.stock IS '수량'
/

COMMENT ON COLUMN PURCHASE.buy_no IS '결제넘버'
/

COMMENT ON COLUMN PURCHASE.buy_date IS '결제날짜'
/

COMMENT ON COLUMN PURCHASE.buy_addr IS '실제받을주소'
/

ALTER TABLE PURCHASE
    ADD CONSTRAINT FK_PURCHASE_member_no_Member_m FOREIGN KEY (member_no)
        REFERENCES Member (member_no)
	on delete cascade
/

ALTER TABLE PURCHASE
    ADD CONSTRAINT FK_PURCHASE_pno_PRODUCT_pno FOREIGN KEY (pno)
        REFERENCES PRODUCT (pno)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE Member_Mapping
(
    mapping_seq        NUMBER    NOT NULL, 
    member_no          NUMBER    NOT NULL, 
    trainer_no         NUMBER    NOT NULL, 
    training_cnt       NUMBER    NOT NULL, 
    training_maxcnt    NUMBER    NOT NULL, 
    CONSTRAINT MEMBER_MAPPING_PK PRIMARY KEY (mapping_seq)
)
/

CREATE SEQUENCE Member_Mapping_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER Member_Mapping_AI_TRG
BEFORE INSERT ON Member_Mapping 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Member_Mapping_SEQ.NEXTVAL
    INTO :NEW.mapping_seq
    FROM DUAL;
END;
/

--DROP TRIGGER Member_Mapping_AI_TRG;
/

--DROP SEQUENCE Member_Mapping_SEQ;
/

COMMENT ON TABLE Member_Mapping IS '회원 명단 관리'
/

COMMENT ON COLUMN Member_Mapping.mapping_seq IS '매칭 시퀀스'
/

COMMENT ON COLUMN Member_Mapping.member_no IS '회원번호'
/

COMMENT ON COLUMN Member_Mapping.trainer_no IS '트레이너 번호'
/

COMMENT ON COLUMN Member_Mapping.training_cnt IS '트레이닝 횟수'
/

COMMENT ON COLUMN Member_Mapping.training_maxcnt IS '트레이닝 최대 횟수'
/

ALTER TABLE Member_Mapping
    ADD CONSTRAINT FK_Member_Mapping_member_no_Me FOREIGN KEY (member_no)
        REFERENCES Member (member_no)
	on delete cascade
/

ALTER TABLE Member_Mapping
    ADD CONSTRAINT FK_Member_Mapping_trainer_no_M FOREIGN KEY (trainer_no)
        REFERENCES Member (member_no)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE Report
(
    write_type       NUMBER           NOT NULL, 
    write_no         NUMBER           NOT NULL, 
    reported_no      NUMBER           NULL, 
    member_no        NUMBER           NOT NULL, 
    report_cat       NUMBER           NOT NULL, 
    report_detail    VARCHAR2(900)    NOT NULL
)
/

COMMENT ON TABLE Report IS '신고'
/

COMMENT ON COLUMN Report.write_type IS '게시글 타입'
/

COMMENT ON COLUMN Report.write_no IS '글 번호'
/

COMMENT ON COLUMN Report.reported_no IS '신고 당한 회원 번호'
/

COMMENT ON COLUMN Report.member_no IS '신고한 회원 번호'
/

COMMENT ON COLUMN Report.report_cat IS '신고 사유'
/

COMMENT ON COLUMN Report.report_detail IS '상세 신고사유'
/

ALTER TABLE Report
    ADD CONSTRAINT FK_Report_report_cat_Report_Ca FOREIGN KEY (report_cat)
        REFERENCES Report_Cat (report_no)
	on delete cascade
/

ALTER TABLE Report
    ADD CONSTRAINT FK_Report_member_no_Member_mem FOREIGN KEY (member_no)
        REFERENCES Member (member_no)
	on delete cascade
/

ALTER TABLE Report
    ADD CONSTRAINT FK_Report_reported_no_Member_m FOREIGN KEY (reported_no)
        REFERENCES Member (member_no)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE BMI
(
    inbody_no       NUMBER          NOT NULL, 
    member_no       NUMBER          NOT NULL, 
    measure_date    DATE            NOT NULL, 
    weight          NUMBER    NOT NULL, 
    bone            NUMBER    NOT NULL, 
    bodyfat         NUMBER    NOT NULL, 
    bodywater       NUMBER    NOT NULL, 
    protein         NUMBER    NOT NULL, 
    mineral         NUMBER    NOT NULL, 
    bmi             NUMBER    NOT NULL, 
    bodyfat_per     NUMBER    NOT NULL, 
    abfat_per       NUMBER    NOT NULL, 
    metabolism      NUMBER    NOT NULL, 
    CONSTRAINT BMI_PK PRIMARY KEY (inbody_no)
)
/

CREATE SEQUENCE BMI_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER BMI_AI_TRG
BEFORE INSERT ON BMI 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT BMI_SEQ.NEXTVAL
    INTO :NEW.inbody_no
    FROM DUAL;
END;
/

--DROP TRIGGER BMI_AI_TRG;
/

--DROP SEQUENCE BMI_SEQ;
/

COMMENT ON TABLE BMI IS '회원 인바디'
/

COMMENT ON COLUMN BMI.inbody_no IS '인바디 번호'
/

COMMENT ON COLUMN BMI.member_no IS '회원 번호'
/

COMMENT ON COLUMN BMI.measure_date IS '측정 날짜'
/

COMMENT ON COLUMN BMI.weight IS '회원 몸무게'
/

COMMENT ON COLUMN BMI.bone IS '골격근량'
/

COMMENT ON COLUMN BMI.bodyfat IS '체지방량'
/

COMMENT ON COLUMN BMI.bodywater IS '체수분'
/

COMMENT ON COLUMN BMI.protein IS '단백질'
/

COMMENT ON COLUMN BMI.mineral IS '무기질'
/

COMMENT ON COLUMN BMI.bmi IS 'BMI'
/

COMMENT ON COLUMN BMI.bodyfat_per IS '체지방률'
/

COMMENT ON COLUMN BMI.abfat_per IS '복부지방률'
/

COMMENT ON COLUMN BMI.metabolism IS '기초대사량'
/

ALTER TABLE BMI
    ADD CONSTRAINT FK_BMI_member_no_Member_member FOREIGN KEY (member_no)
        REFERENCES Member (member_no)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE menu_comment
(
    cmt_no         NUMBER            NOT NULL, 
    menu_no        NUMBER            NOT NULL, 
    cmt_date       DATE              NOT NULL, 
    cmt_content    VARCHAR2(4000)    NOT NULL, 
    CONSTRAINT MENU_COMMENT_PK PRIMARY KEY (cmt_no)
)
/

CREATE SEQUENCE menu_comment_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER menu_comment_AI_TRG
BEFORE INSERT ON menu_comment 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT menu_comment_SEQ.NEXTVAL
    INTO :NEW.cmt_no
    FROM DUAL;
END;
/

--DROP TRIGGER menu_comment_AI_TRG;
/

--DROP SEQUENCE menu_comment_SEQ;
/

COMMENT ON TABLE menu_comment IS '회원 식단 코멘트'
/

COMMENT ON COLUMN menu_comment.cmt_no IS '댓글 시퀀스'
/

COMMENT ON COLUMN menu_comment.menu_no IS '식단 게시글'
/

COMMENT ON COLUMN menu_comment.cmt_date IS '댓글일시'
/

COMMENT ON COLUMN menu_comment.cmt_content IS '댓글 콘텐츠'
/

ALTER TABLE menu_comment
    ADD CONSTRAINT FK_menu_comment_menu_no_Eat_lo FOREIGN KEY (menu_no)
        REFERENCES Eat_log (menu_no)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE Attendance
(
    member_no      NUMBER    NOT NULL, 
    attend_date    DATE      NOT NULL
)
/

COMMENT ON TABLE Attendance IS '출결'
/

COMMENT ON COLUMN Attendance.member_no IS '회원 번호'
/

COMMENT ON COLUMN Attendance.attend_date IS '출석일'
/

ALTER TABLE Attendance
    ADD CONSTRAINT FK_Attendance_member_no_Member FOREIGN KEY (member_no)
        REFERENCES Member (member_no)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE attendance_avgtime
(
    avg_date    DATE      NOT NULL, 
    avg_time    NUMBER    NOT NULL
)
/

COMMENT ON TABLE attendance_avgtime IS '출석 평균 시간'
/

COMMENT ON COLUMN attendance_avgtime.avg_date IS '출결 날짜'
/

COMMENT ON COLUMN attendance_avgtime.avg_time IS '평균시간'
/


-- Member Table Create SQL
CREATE TABLE Mail
(
    mail_no         NUMBER            NOT NULL, 
    sender          NUMBER            NOT NULL, 
    receiver        NUMBER            NOT NULL, 
    mail_content    VARCHAR2(1000)    NOT NULL, 
    write_date      VARCHAR2(20)      NOT NULL, 
    read_count      NUMBER            NOT NULL, 
    CONSTRAINT MAIL_PK PRIMARY KEY (mail_no)
)
/

CREATE SEQUENCE Mail_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER Mail_AI_TRG
BEFORE INSERT ON Mail 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Mail_SEQ.NEXTVAL
    INTO :NEW.mail_no
    FROM DUAL;
END;
/

--DROP TRIGGER Mail_AI_TRG;
/

--DROP SEQUENCE Mail_SEQ;
/

COMMENT ON TABLE Mail IS '쪽 지함'
/

COMMENT ON COLUMN Mail.mail_no IS '쪽지번호'
/

COMMENT ON COLUMN Mail.sender IS '송신자'
/

COMMENT ON COLUMN Mail.receiver IS '수신자'
/

COMMENT ON COLUMN Mail.mail_content IS '쪽지내용'
/

COMMENT ON COLUMN Mail.write_date IS '작성일'
/

COMMENT ON COLUMN Mail.read_count IS '쪽지조회여부'
/

ALTER TABLE Mail
    ADD CONSTRAINT FK_Mail_sender_Member_member_n FOREIGN KEY (sender)
        REFERENCES Member (member_no)
	on delete cascade
/

ALTER TABLE Mail
    ADD CONSTRAINT FK_Mail_receiver_Member_member FOREIGN KEY (receiver)
        REFERENCES Member (member_no)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE Like_table
(
    pno          NUMBER             NOT NULL, 
    member_no    NUMBER    NOT NULL, 
    CONSTRAINT LIKE_TABLE_PK PRIMARY KEY (pno, member_no)
)
/

COMMENT ON TABLE Like_table IS '종아요'
/
ALTER TABLE Like_table
    ADD CONSTRAINT FK_Like_table_pno_PRODUCT_pno FOREIGN KEY (pno)
        REFERENCES PRODUCT (pno)
	on delete cascade
/

ALTER TABLE Like_table
    ADD CONSTRAINT FK_Like_table_member_no_Member FOREIGN KEY (member_no)
        REFERENCES Member (member_no)
	on delete cascade
/


-- Member Table Create SQL
CREATE TABLE ban_list
(
    ban_seq      NUMBER          NOT NULL, 
    member_no    NUMBER          NOT NULL, 
    ban_date     VARCHAR2(20)    NOT NULL, 
    CONSTRAINT BAN_LIST_PK PRIMARY KEY (ban_seq)
)
/

CREATE SEQUENCE ban_list_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER ban_list_AI_TRG
BEFORE INSERT ON ban_list 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT ban_list_SEQ.NEXTVAL
    INTO :NEW.ban_seq
    FROM DUAL;
END;
/

ALTER TABLE ban_list
    ADD CONSTRAINT FK_ban_list_member_no_Member FOREIGN KEY (member_no)
        REFERENCES Member (member_no)
	on delete cascade
/

--DROP TRIGGER ban_list_AI_TRG;
/

--DROP SEQUENCE ban_list_SEQ;
/

COMMENT ON TABLE ban_list IS '정지 테이블'
/

COMMENT ON COLUMN ban_list.ban_seq IS '정지시퀀스'
/

COMMENT ON COLUMN ban_list.member_no IS '회원번호'
/

COMMENT ON COLUMN ban_list.ban_date IS '정지날짜'
/

---------------------------------------------------
------------------- 테이블 수정 ---------------------
---------------------------------------------------
ALTER TABLE Nutrition_table MODIFY(food_name VARCHAR2(200));
ALTER TABLE Eat_log MODIFY(food_name VARCHAR2(200));
ALTER TABLE Eat_log DROP CONSTRAINT FK_Eat_log_food_name_Nutrition;
ALTER TABLE menu_comment ADD (writer_no NUMBER not null);
COMMENT ON COLUMN menu_comment.writer_no IS '작성자 번호';
ALTER TABLE menu_comment
    ADD CONSTRAINT FK_menu_comment_writer_no FOREIGN KEY (writer_no)
        REFERENCES member (member_no)
	on delete cascade
/