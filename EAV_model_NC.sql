drop table OBJTYPE cascade constraints;
drop table ATTRTYPE cascade constraints;
drop table OBJREFERENCE cascade constraints;
drop table ATTRIBUTES cascade constraints;
drop table OBJECTS cascade constraints;

CREATE TABLE OBJTYPE
(
    OBJECT_TYPE_ID NUMBER(20)   NOT NULL ENABLE,
    PARENT_ID      NUMBER(20),
    CODE           VARCHAR2(40) NOT NULL UNIQUE,
    NAME           VARCHAR2(200 BYTE),
    DESCRIPTION    VARCHAR2(1000 BYTE),
    CONSTRAINT CON_OBJECT_TYPE_ID PRIMARY KEY (OBJECT_TYPE_ID),
    CONSTRAINT CON_PARENT_ID FOREIGN KEY (PARENT_ID) REFERENCES OBJTYPE (OBJECT_TYPE_ID) ON DELETE CASCADE ENABLE
);

CREATE TABLE ATTRTYPE
(
    ATTR_ID            NUMBER(20) NOT NULL,
    OBJECT_TYPE_ID     NUMBER(20) NOT NULL,
    OBJECT_TYPE_ID_REF NUMBER(20),
    CODE               VARCHAR2(40),
    NAME               VARCHAR2(200 BYTE),
    --ATTR_TYPE          NUMBER(20), -- число которое обзначает, какой это атрибут: дата, число, буквы, валюта...
    CONSTRAINT CON_ATTR_ID PRIMARY KEY (ATTR_ID),
    CONSTRAINT CON_ATTR_OBJECT_TYPE_ID FOREIGN KEY (OBJECT_TYPE_ID) REFERENCES OBJTYPE (OBJECT_TYPE_ID),
    CONSTRAINT CON_ATTR_OBJECT_TYPE_ID_REF FOREIGN KEY (OBJECT_TYPE_ID_REF) REFERENCES OBJTYPE (OBJECT_TYPE_ID)
);

CREATE TABLE OBJECTS
(
    OBJECT_ID      NUMBER(20) NOT NULL,
    PARENT_ID      NUMBER(20),
    OBJECT_TYPE_ID NUMBER(20) NOT NULL,
    NAME           VARCHAR2(2000 BYTE),
    DESCRIPTION    VARCHAR2(4000 BYTE),
    CONSTRAINT CON_OBJECTS_ID PRIMARY KEY (OBJECT_ID),
    CONSTRAINT CON_PARENTS_ID FOREIGN KEY (PARENT_ID) REFERENCES OBJECTS (OBJECT_ID) ON DELETE CASCADE DEFERRABLE,
    CONSTRAINT CON_OBJ_TYPE_ID FOREIGN KEY (OBJECT_TYPE_ID) REFERENCES OBJTYPE (OBJECT_TYPE_ID)
);

CREATE TABLE ATTRIBUTES
(
    ATTR_ID    number(10) not null,
    OBJECT_ID  number(20) not null,
    VALUE      varchar2(4000 byte),
    DATE_VALUE date,
    constraint con_ATR_attr_id foreign key (ATTR_ID) references AttrType (attr_id) on delete cascade,
    constraint con_ATR_object_id foreign key (OBJECT_ID) references Objects (object_id) on delete cascade
);

CREATE TABLE OBJREFERENCE
(
    ATTR_ID   NUMBER(20) NOT NULL,
    REFERENCE NUMBER(20) NOT NULL,
    OBJECT_ID NUMBER(20) NOT NULL,
    CONSTRAINT CON_OBJREFERENCE_PK PRIMARY KEY (ATTR_ID, REFERENCE, OBJECT_ID),
    CONSTRAINT CON_REFERENCE FOREIGN KEY (REFERENCE) REFERENCES OBJECTS (OBJECT_ID) ON DELETE CASCADE,
    CONSTRAINT CON_ROBJECT_ID FOREIGN KEY (OBJECT_ID) REFERENCES OBJECTS (OBJECT_ID) ON DELETE CASCADE,
    CONSTRAINT CON_RATTR_ID FOREIGN KEY (ATTR_ID) REFERENCES ATTRTYPE (ATTR_ID) ON DELETE CASCADE
);

insert into OBJTYPE(object_type_id, code)
values (1, 'USERS');

insert into OBJTYPE(object_type_id, code)
values (2, 'USER_STATUS');

insert into OBJTYPE(object_type_id, code)
values (3, 'STUDENT_DETAIL');

insert into OBJTYPE(object_type_id, code)
values (4, 'ROLE');

insert into OBJTYPE(object_type_id, code)
values (5, 'RESUME_STATUS');

insert into OBJTYPE(object_type_id, code)
values (6, 'RESUME_KNOWLEDGE');

insert into OBJTYPE(object_type_id, code)
values (7, 'RESUME');

insert into OBJTYPE(object_type_id, code)
values (8, 'QA_RESUME_DETAIL');

insert into OBJTYPE(object_type_id, code)
values (9, 'QA_INTERVIEW_RESULT_DETAIL');

insert into OBJTYPE(object_type_id, code)
values (10, 'POSITION');

insert into OBJTYPE(object_type_id, code)
values (11, 'MAIL_QUEUE');

insert into OBJTYPE(object_type_id, code)
values (12, 'KNOWLEDGE_TYPE');

insert into OBJTYPE(object_type_id, code)
values (13, 'INTERVIEW_SLOT');

insert into OBJTYPE(object_type_id, code)
values (14, 'INTERVIEW_RESULT');

insert into OBJTYPE(object_type_id, code)
values (15, 'INTERVIEW');

insert into OBJTYPE(object_type_id, code)
values (16, 'INSTITUTE');

insert into OBJTYPE(object_type_id, code)
values (17, 'DEV_RESUME_DETAIL');

insert into OBJTYPE(object_type_id, code)
values (18, 'DEV_INTERVIEW_RESULT_DETAIL');

--ATTRTYPE
--USERS
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (1, 1, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (2, 1, 'LOGIN');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (3, 1, 'PASSWORD');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (4, 1, 'LAST_LOGIN_DATE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (5, 1, 'ARCHVIVE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (6, 1, 'ROLE_ID');

--USER_STATUS
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (7, 2, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (8, 2, 'DESCRIPTION');

--STUDENT_DETAIL
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (9, 3, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (10, 3, 'POSITION_ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (11, 3, 'USER_STATUS_ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
    values (12, 3, 'USER_ID');

--ROLE
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (13, 4, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (14, 4, 'DESCRIPTION');

--RESUME_STATUS
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (15, 5, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (16, 5, 'DESCRIPTION');

--RESUME_KNOWLEDGE
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (17, 6, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (18, 6, 'KNOWLEDGE_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (19, 6, 'KNOWLEDGE_TYPE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (20, 6, 'RESUME_ID');

--RESUME
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (21, 7, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (22, 7, 'VERSION');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (23, 7, 'ERROR_DESCRIPTION');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (24, 7, 'MODIFIED_DATE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (25, 7, 'APPROVED_DATE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (26, 7, 'NAME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (27, 7, 'SURNAME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (28, 7, 'ENG_NAME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (29, 7, 'ENG_SURNAME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (30, 7, 'LAST_NAME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (31, 7, 'EMAIL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (32, 7, 'TELEPHONE_NUM');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (33, 7, 'SKYPE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (34, 7, 'PHOTO_PATH');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (35, 7, 'RESUME_STATUS_ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (36, 7, 'USER_ID');

--QA_RESUME_DETAIL
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (37, 8, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (38, 8, 'INSTITUTE_OTHER_NAME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (39, 8, 'COURSE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (40, 8, 'FACULTY');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (41, 8, 'GRADUATION_YEAR');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (42, 8, 'IS_STUDENT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (43, 8, 'OTHER_CONTACTS');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (44, 8, 'TRAINING_CENTER_INTEREST');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (45, 8, 'WORK_IN_NETCRACKER_INTEREST');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (46, 8, 'OTHER_INTEREST');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (47, 8, 'QA_DEVELOPMENT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (48, 8, 'SOFTWARE_DEVELOPMENT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (49, 8, 'OTHER_JOB_INTERESTS');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (50, 8, 'QA_EXPERT_WORK_TYPE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (51, 8, 'QA_AUTOMATION_WORK_TYPE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (52, 8, 'QA_DEVELOPMENT_WORK_TYPE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (53, 8, 'SOFTWARE_DEVELOPMENT_WORK_TYPE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (54, 8, 'LEADERSHIP_WORK_TYPE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (55, 8, 'OTHER_WORK_TYPE_SPECIFIC');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (56, 8, 'SOFTWARE_DEV_LIFE_CYCLE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (57, 8, 'QA_ROLE_IN_LIFE_CYCLE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (58, 8, 'WHAT_IS_TEST_CASE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (59, 8, 'WHAT_IS_DEFECT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (60, 8, 'TESTING_TYPE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (61, 8, 'NETWORK_TECHNOLOGY');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (62, 8, 'OOP');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (63, 8, 'DB_SQL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (64, 8, 'CLIENT_SERVER_ARCHITECTURE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (65, 8, 'OTHER_SKILL_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (66, 8, 'WORK_EXPERIENCE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (67, 8, 'ENGLISH_READ_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (68, 8, 'ENGLISH_WRITE_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (69, 8, 'ENGLISH_SPEAK_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (70, 8, 'WHERE_YOU_KNOW_ABOUT_TC');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (71, 8, 'WHY_TAKE_YOU_IN_NETCRACKER');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (72, 8, 'MORE_INFORMATION_ADOUT_YOU');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (73, 8, 'INSTITUTE_ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (74, 8, 'RESUME_ID');


--QA_INTERVIEW_RESULT_DETAIL
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (75, 9, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (76, 9, 'HR_COME_TO_INTERVIEW');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (77, 9, 'HR_WORK_WITH_USER');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (78, 9, 'HR_OTHER_INFORMATION');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (79, 9, 'HR_FINAL_ASSESSMENT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (80, 9, 'QA_KNOWLEDGE_1');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (81, 9, 'QA_KNOWLEDGE_2');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (82, 9, 'QA_KNOWLEDGE_3');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (83, 9, 'QA_KNOWLEDGE_4');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (84, 9, 'QA_KNOWLEDGE_5');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (85, 9, 'QA_KNOWLEDGE_6');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (86, 9, 'IT_KNOWLEDGE_1');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (87, 9, 'IT_KNOWLEDGE_2');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (88, 9, 'IT_KNOWLEDGE_3');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (89, 9, 'IT_KNOWLEDGE_4');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (90, 9, 'INTERVIEWER_FINAL_ASSESSMENT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (91, 9, 'INTERVIEWER_BASIC_INFORMATION');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (92, 9, 'INTERVIEWER_OTHER_INFORMATION');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (93, 9, 'INTERVIEWER_WORK_WITH_USER');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (94, 9, 'INTERVIEWER_COME_TO_INTERVIEW');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (95, 9, 'INTERVIEW_RESULT_ID');

--POSITION
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (96, 10, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (97, 10, 'DESCRIPTION');


--MAIL_QUEUE
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (98, 11, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (99, 11, 'ADDED_WHEN');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (100, 11, 'IS_SENT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (101, 11, 'IS_INCORRECT_MAIL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (102, 11, 'RECIVER_ADDRESS');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (103, 11, 'MESSAGE_SUBJECT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (104, 11, 'MESSAGE_BODY');


--KNOWLEDGE_TYPE
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (105, 12, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (106, 12, 'DESCRIPTION');


--INTERVIEW_SLOT
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (107, 13, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (108, 13, 'TIME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (109, 13, 'INTERVIEW_ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (110, 13, 'USER_ID');


--INTERVIEW_RESULT
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (111, 14, 'INTERVIEW_SLOT_ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (112, 14, 'IS_COME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (113, 14, 'HR_USER_ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (114, 14, 'INTERVIEWER_USER_ID');

--INTERVIEW
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (115, 15, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (116, 15, 'LOGIN');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (117, 15, 'START_TIME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (118, 15, 'END_TIME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (119, 15, 'HR_TIME_FOR_INTERVIEW');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (120, 15, 'INTERVIEW_TIME_FOR_INTERVIEW');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (121, 15, 'TOTAL_PLACE_COUNT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (122, 15, 'AVAILABLE_PLACE_COUNT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (123, 15, 'INTERVIEW_COUNT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (124, 15, 'HR_COUNT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (125, 15, 'ENABLE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (126, 15, 'POSITION_ID');

--INSTITUTE
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (127, 16, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (128, 16, 'DESCRIPTION');

--DEV_RESUME_DETAIL
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (129, 17, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (130, 17, 'INSTITUTE_OTHER_NAME');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (131, 17, 'COURCE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (132, 17, 'FACULTY');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (133, 17, 'DEPARTMENT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (134, 17, 'SPECIALITY');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (135, 17, 'GRADUATION_YEAR');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (136, 17, 'OTHER_CONTACTS');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (137, 17, 'TRAINING_CENTER_INTEREST');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (138, 17, 'WORK_IN_NETCRACKER_INTEREST');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (139, 17, 'OTHER_JOB_INTEREST');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (140, 17, 'BACK_END_INTEREST');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (141, 17, 'FRONT_END_INTEREST');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (142, 17, 'DB_INTEREST');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (143, 17, 'OTHER_WORK_TYPE_SPECIFIC');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (144, 17, 'OPP_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (145, 17, 'DB_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (146, 17, 'WEB_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (147, 17, 'USER_INTERFACE_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (148, 17, 'UML_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (149, 17, 'OTHER_SKILL_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (150, 17, 'WORK_EXPERIENCE');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (151, 17, 'ENGLISH_READ_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (152, 17, 'ENGLISH_WRITE_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (153, 17, 'ENGLISH_SPEAK_LEVEL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (154, 17, 'WHERE_YOU_KNOW_ABOUT_TC');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (155, 17, 'WHY_TAKE_YOU_IN_NETCRACKER');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (156, 17, 'MORE_INFORMATION_ABOUT_YOU');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (157, 17, 'INSTITUTE_ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (158, 17, 'RESUME_ID');

--DEV_INTERVIEW_RESULT_DETAIL
insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (159, 18, 'ID');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (160, 18, 'JAVA_SKILL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (161, 18, 'SQL_SKILL');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (162, 18, 'INTERVIEWER_OTHER_INFORMATION');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (163, 18, 'INTERVIEWER_WORK_WITH_USER');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (164, 18, 'HR_OTHER_INFORMATION');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (165, 18, 'HR_WORK_WITH_USER');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (166, 18, 'DEV_FINAL_ASSESSMENT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (167, 18, 'HR_FINAL_ASSESSMENT');

insert into ATTRTYPE(ATTR_ID, OBJECT_TYPE_ID, CODE)
values (168, 18, 'INTERVIEW_RESULT_ID');

commit;
