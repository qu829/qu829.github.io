-- ������ְ����Ϣ��
CREATE TABLE TB_APPLICANT(
	APPLICANT_ID NUMBER PRIMARY KEY,
	APPLICANT_EMAIL VARCHAR2(50) NOT NULL,
	APPLICANT_PWD VARCHAR2(50) NOT NULL,
	APPLICANT_REGISTDATE TIMESTAMP 
)SEGMENT CREATION IMMEDIATE;

-- ������ְ����Ϣ����ʹ�õ�����
CREATE SEQUENCE SEQ_ITOFFER_APPLICANT MINVALUE 1 START WITH 1 INCREMENT BY 1;
-- ��ְ����Ϣ���������
INSERT INTO tb_applicant(applicant_id, applicant_email, applicant_pwd, applicant_registdate)VALUES(SEQ_ITOFFER_APPLICANT.NEXTVAL,'qst@itoffer.cn','123456',to_timestamp('2011-01-01 13:14:20','yyyy-MM-dd HH24:mi:ss'));
COMMIT;

-- ��������������Ϣ��
CREATE TABLE TB_RESUME_BASICINFO(
	BASICINFO_ID NUMBER PRIMARY KEY,
	APPLICANT_ID NUMBER NOT NULL,
	REALNAME VARCHAR2(50) NOT NULL,
	GENDER VARCHAR2(50) NOT NULL,
	BIRTHDAY TIMESTAMP,
	CURRENT_LOC VARCHAR2(255),
	RESIDENT_LOC VARCHAR2(255),
	TELEPHONE VARCHAR2(50),
	EMAIL VARCHAR2(50),
	JOB_INTENSION VARCHAR2(50),
	JOB_EXPERIENCE VARCHAR2(255),
	HEAD_SHOT VARCHAR2(255),
	CONSTRAINT TB_RESUME_BASICINFO_FK1 FOREIGN KEY(APPLICANT_ID) REFERENCES TB_APPLICANT(APPLICANT_ID),
	CONSTRAINT TB_RESUME_BASICINFO_CK1 CHECK (GENDER IN ('��','Ů'))
)SEGMENT CREATION IMMEDIATE;
-- ����������Ϣ����ʹ�õ�����
CREATE SEQUENCE SEQ_ITOFFER_RESUMEBASICINFO MINVALUE 1 START WITH 1 INCREMENT BY 1;
COMMIT;
-- ����������Ϣ��������
INSERT INTO tb_resume_basicinfo(basicinfo_id, applicant_id, realname, gender, birthday, current_loc, resident_loc, telephone, email, job_intension, job_experience, head_shot) VALUES(SEQ_ITOFFER_RESUMEBASICINFO.NEXTVAL,1,'����','��',to_timestamp('1993-11-05','yyyy-mm-dd'),'ɽ��ʡ�ൺ�и�����','ɽ��ʡ�ൺ��','13166666666','qst@itoffer.cn','Java�������','�ողμӹ���'��'QST.jpg');
COMMIT;

-- ��ҵ��Ϣ��
CREATE TABLE TB_COMPANY(
	COMPANY_ID NUMBER PRIMARY KEY,
	COMPANY_NAME VARCHAR2(50),
	COMPANY_AREA VARCHAR2(50),
	COMPANY_SIZE VARCHAR2(50),
	COMPANY_TYPE VARCHAR2(50),
	COMPANY_BRIEF VARCHAR2(2000),
	COMPANY_STATE NUMBER,
	COMPANY_SORT NUMBER, 
	COMPANY_VIEWNUM NUMBER,
	COMPANY_PIC VARCHAR2(255),
	CONSTRAINT "TB_COMPANY_CK1" CHECK (COMPANY_STATE IN (1,2,3))
)SEGMENT CREATION IMMEDIATE;
-- ��ҵ��Ϣ����ʹ�õ�����
CREATE SEQUENCE SEQ_ITOFFER_COMPANY MINVALUE 1 START WITH 1 INCREMENT BY 1;
-- ��ҵ��Ϣ���������
INSERT INTO tb_company(company_id,company_name,company_area,company_size,company_type,company_brief,company_state,company_sort,company_viewnum,company_pic) VALUES(SEQ_ITOFFER_COMPANY.NEXTVAL,'��־����ɷ����޹�˾','������','1000������','�ɷ�����ҵ','��־����ɷ����޹�˾������2003��1�£���һ��������Ϊ����ҵ�ṩ�����Ʒ�з���������������ITϵͳ���ɷ���ҵ��Χ����֤ȯ�����У����գ��������������ȡ�������ҵ��Ʒ�з��������������רҵ�Լ��ȶ��ԣ��ѳ�Ϊ��ҵ�ĺ��ľ���������˾���ձ��������Ϻ������������ڵȵؾ����з�֧��������־�������10���ķ�չ���õ����к�����ͻ��߶��Ͽɣ������й����ձ��γ���һ����Ʒ��֪���ȣ�����ҵ�����ձ��г�Ϊ���ģ��ѳ�Ϊ����֪����ҵ�ĺ��Ĺ�Ӧ�̣���2011�����������ҵ���а������е�10���������2011-2012����ҹ滮�������ص������ҵ�ƺš���־������Ȳ�����߶�������ҵ���ͬʱ�������з����ڸ߶˽��ڲ�Ʒ��������������ר���������˶��ӵ������֪ʶ��Ȩ�Ľ��������Ʒ��Ͷ����ҵӦ�ò��õ��ͻ��ĸ߶����ۣ����ڹ����г���ո¶ͷ�ǡ�',1,1,1389,'635170123249913750.jpg');
INSERT INTO tb_company(company_id,company_name,company_area,company_size,company_type,company_brief,company_state,company_sort,company_viewnum,company_pic) VALUES(SEQ_ITOFFER_COMPANY.NEXTVAL,'���ݴ�������Ϣ�������޹�˾','������','100-200��','������ҵ','���ݴ�������Ϣ�������޹�˾������2008��10�£��Ǵ�������Ϣ���죨�й������޹�˾ȫ���ӹ�˾��ע���ʽ�Ϊ1600��Ԫ����˾λ�ڷ羰�������й��¼��º������ݹ�ҵ԰���������߽�����ӵ���Լ��İ칫���з���¥����԰���ص�������������������ҵ����˾��һ��רҵ���¹��ʺ͹�������ҵ��Ϣ������������������ĸ߿Ƽ���ҵ��Ϊ��������ҵ�ṩһ�������������ϵͳ���ɼ�ά�����ͻ�֧�ֵ��ۺϵ���Ϣ���񡣹�˾ӵ��һ֧�����ʵĹ����뿪���Ŷӣ��������õ����������ͷḻ�������ƿ������飬ͬʱ�߱��������ͻ�����������ͨ��������˾�������񣬱������Ƚ���չ����ͷ����ҵ���淢չ��׳��Ŀǰ�������������ҵ�����˳����ȶ��Ŀͻ���ϵ����˾��2009��7�·�˳��ͨ��ISO27001��Ϣ��ȫ����Ĺ�����֤��2010��6��˳��ͨ��CMMI3����֤����˾�߱����ƵĹ���������ѵ��н�긣����ϵ�Լ���ȫ�Ĺ����ƶȣ�ΪԱ���Ĺ�����ѧϰ�ṩ�˹��������ɵķ�չ�ռ䡣',1,2,577,'635508802169230812.jpg');
INSERT INTO tb_company(company_id,company_name,company_area,company_size,company_type,company_brief,company_state,company_sort,company_viewnum,company_pic) VALUES(SEQ_ITOFFER_COMPANY.NEXTVAL,'����������ʤ��Ϣϵͳ���޹�˾','������','200-500��','������ҵ','����������ʤ��Ϣϵͳ���޹�˾�����BHH�����������ǿ֮һ��HITACHI�������ź���Ϣ��ҵ������������ͬͶ�������ĸ��¼�����ҵ����˾��Ҫ���¶����������,�Գ������������ǳн����ձ���������?֤ȯ���������ϵͳ���ձ��¸�����·��λԤԼϵͳ�������ձ��������صĲ�����ϵͳ/˰�����ϵͳ/������Ϣ����ϵͳ����˰ϵͳ����������ϵͳ�����۹���ϵͳ���ձ������������̵�ECU�������Ϣ�ն��豸����ȸ��ִ������������Ŀ��ҵ�����򺭸ǣ����ڡ���ҵ/��ͨ������������ATM�Լ�Ƕ��ʽ������򡣴�1996���𣬹�˾���Ѿ���ʼ��������������ơ����������ơ��Զ�Ѳ�����Ƶ������Ƕ��ʽ��������������˷ḻ��Ƕ��ʽ����Ŀ������顣��˾ʮ��ע�ض�Ա�������Ｐҵ������ѵ���ṩ��γ�����������ͳ�ֵķ�չ�ռ䣻��˾Ա�����������õ�н�ʺ��걸�ĸ������մ�����������һ�𡱺Ͳ���ҽ��/�����˺����գ��Լ������������ֿ������־�ڴ��¶�������������²ż汸�ı�ҵ�����ˣ����������Լ���ո�������ӭ��λ��ʶ֮ʿ�ļ��ˡ�',1,3,1183,'635086129655240312.jpg');
COMMIT;


-- ��Ƹְλ��Ϣ��
CREATE TABLE TB_JOB(
	JOB_ID NUMBER PRIMARY KEY,
	COMPANY_ID NUMBER NOT NULL,
	JOB_NAME VARCHAR2(100),
	JOB_HIRINGNUM NUMBER,
	JOB_SALARY VARCHAR2(20),
	JOB_AREA VARCHAR2(255),
	JOB_DESC VARCHAR2(255),
	JOB_ENDTIME TIMESTAMP,
	JOB_STATE NUMBER,
	CONSTRAINT TB_JOB_CHK1 CHECK (JOB_STATE IN (1,2,3)),
	CONSTRAINT TB_JOB_TB_COMPANY_FK1 FOREIGN KEY (COMPANY_ID) REFERENCES TB_COMPANY (COMPANY_ID)
)SEGMENT CREATION IMMEDIATE;
-- ��Ƹְλ��Ϣ����������
CREATE SEQUENCE SEQ_ITOFFER_JOB MINVALUE 1 START WITH 1 INCREMENT BY 1;
-- ��Ƹְλ��Ϣ���������
INSERT INTO tb_job(job_id, company_id, job_name, job_hiringnum, job_salary, job_area, job_desc, job_endtime, job_state) VALUES (SEQ_ITOFFER_JOB.NEXTVAL,1,'���������������ʦ���ṩ��ǰ��ѵ��',100,'2500~4000Ԫ/��','������','�������������������򿪷�������ʵʩ�ȹ�����', to_timestamp('2016-03-05','yyyy-mm-dd'),1);
INSERT INTO tb_job(job_id, company_id, job_name, job_hiringnum, job_salary, job_area, job_desc, job_endtime, job_state) VALUES (SEQ_ITOFFER_JOB.NEXTVAL,2,'Java�����������ʦ���ṩ��ǰ��ѵ��',20,'2500~4000Ԫ/��','��ҵ԰��','��Կͻ��ֳ���������ṩ����֧�֣��������з�ʵ�������ֿͻ�������⣬������������ԭ���ṩ��������������Ը��µĴ�����Ͽͻ�Ҫ��', to_timestamp('2016-03-05','yyyy-mm-dd'),1);
INSERT INTO tb_job(job_id, company_id, job_name, job_hiringnum, job_salary, job_area, job_desc, job_endtime, job_state) VALUES (SEQ_ITOFFER_JOB.NEXTVAL,3,'��������������ṩ��ǰ��ѵ��',40,'4��-4.5��/��','������','J2EE���� TOMCAT/JBOSS������Ӧ�÷����� Webservice��SOCKET��SNMP�ȱ�׼�ӿں�Э��,Struts2��Spring��Hibernate�ȳ��ÿ�� Linux����ϵͳ��oracle��', to_timestamp('2016-03-05','yyyy-mm-dd'),1);
COMMIT;


-- ְλ������Ϣ��
CREATE TABLE TB_JOBAPPLY(
	APPLY_ID NUMBER PRIMARY KEY,
	JOB_ID NUMBER NOT NULL,
	APPLICANT_ID NUMBER NOT NULL,
	APPLY_DATE TIMESTAMP,
	APPLY_STATE NUMBER,
	CONSTRAINT TB_JOBAPPLY_TB_JOB_FK1 FOREIGN KEY (JOB_ID) REFERENCES TB_JOB (JOB_ID),
  CONSTRAINT TB_JOBAPPLY_TB_APLLICANT_FK1 FOREIGN KEY (APPLICANT_ID) REFERENCES TB_APPLICANT (APPLICANT_ID)
)SEGMENT CREATION IMMEDIATE;
-- ְλ������Ϣ������
CREATE SEQUENCE SEQ_ITOFFER_JOBAPPLY MINVALUE 1 START WITH 1 INCREMENT BY 1;
-- ְλ������Ϣ���������
INSERT INTO tb_jobapply(apply_id, job_id, applicant_id, apply_date, apply_state) VALUES (SEQ_ITOFFER_JOBAPPLY.NEXTVAL,1,1,to_timestamp('2015-03-05','yyyy-mm-dd'),1);
COMMIT;
