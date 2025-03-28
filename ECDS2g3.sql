/**
* ---------------------
*| IMPORTANT MESSAGES |
*----------------------
* 1) The order in which the tables are created matters, as we are specifying
* constraints to ensure referential integrity
*/



/**
* Create table for storing only the essential information for signing up
* 
* We assume that the attributes should be NOT NULL as enforced by TotalInvest
* 
*/
CREATE TABLE investor_signup (
  phone_number varchar(20) PRIMARY KEY,
  name varchar(255) NOT NULL,
  dob date NOT NULL,
  gender char(1) NOT NULL CHECK (gender IN ('M', 'F', 'O'))
);

/**
* The records are all random, we stick with these first
*/
INSERT INTO investor_signup VALUES('91234567', 'John Wick', '1964-09-12', 'O');
INSERT INTO investor_signup VALUES('81232345', 'Alice Tan', '1985-02-28', 'F');
INSERT INTO investor_signup VALUES('93456789', 'Bob Lim', '1992-11-22', 'M');
INSERT INTO investor_signup VALUES('95551234', 'Cindy Lee', '1978-03-15', 'F');
INSERT INTO investor_signup VALUES('98765432', 'David Ong', '1980-07-07', 'M');
INSERT INTO investor_signup VALUES('90123456', 'Eva Chua', '1995-12-01', 'F');
INSERT INTO investor_signup VALUES('92226789', 'Fiona Tan', '1987-01-10', 'F');
INSERT INTO investor_signup VALUES('96547890', 'George Ho', '1990-06-22', 'M');
INSERT INTO investor_signup VALUES('98324567', 'Hannah Goh', '1990-04-18', 'F');
INSERT INTO investor_signup VALUES('94786234', 'Ian Cheong', '1989-09-05', 'M');
INSERT INTO investor_signup VALUES('89950123', 'Jacky Lau', '1991-10-30', 'M');
INSERT INTO investor_signup VALUES('82340987', 'Kara Chia', '1988-08-11', 'F');
INSERT INTO investor_signup VALUES('97861234', 'Lenny Tan', '1993-05-20', 'M');
INSERT INTO investor_signup VALUES('90657890', 'Megan Tay', '1997-01-29', 'F');
INSERT INTO investor_signup VALUES('93086574', 'Nina Koh', '1982-02-14', 'F');
INSERT INTO investor_signup VALUES('91430257', 'Oscar Tan', '1986-11-10', 'M');
INSERT INTO investor_signup VALUES('97543123', 'Paul Lim', '1994-07-25', 'M');
INSERT INTO investor_signup VALUES('92037456', 'Quincy Yeo', '1983-12-13', 'O');
INSERT INTO investor_signup VALUES('83652019', 'Rita Lee', '1998-08-08', 'O');
INSERT INTO investor_signup VALUES('95732804', 'Simon Ho', '1975-03-02', 'O');

/**
* To answer Query 7 
*/
INSERT INTO investor_signup VALUES('96827418', 'Clyaton Hammond', '1997-11-04', 'M');
INSERT INTO investor_signup VALUES('81548849', 'Blake Wood', '1996-01-24', 'M');
INSERT INTO investor_signup VALUES('94798210', 'Beh De Kang', '1997-02-11', 'M');
INSERT INTO investor_signup VALUES('94612498', 'Teng Yong Rui', '2000-09-30', 'M');
INSERT INTO investor_signup VALUES('86999698', 'Beh Kai De', '1997-03-13', 'M');
INSERT INTO investor_signup VALUES('92347678', 'Chen Kai Ming', '2003-12-27', 'M');
INSERT INTO investor_signup VALUES('81067405', 'Yang Kai De', '2003-03-01', 'M');
INSERT INTO investor_signup VALUES('86408389', 'Goh Jun Cheng', '2002-12-27', 'M');
INSERT INTO investor_signup VALUES('86916680', 'Lam Zi Rui', '2002-03-23', 'M');
INSERT INTO investor_signup VALUES('92948260', 'Hong Kai Ming', '2002-09-02', 'M');

INSERT INTO investor_signup VALUES('87346813', 'Zhuo En Hui', '2000-04-23', 'F');
INSERT INTO investor_signup VALUES('81241249', 'Zhuo Si Wen', '2005-01-01', 'F');
INSERT INTO investor_signup VALUES('86093078', 'Shen Shu Qi', '2002-11-13', 'F');
INSERT INTO investor_signup VALUES('88597986', 'Qin Xin En', '1996-06-15', 'F');
INSERT INTO investor_signup VALUES('83248451', 'How Rui En', '1999-03-11', 'F');
INSERT INTO investor_signup VALUES('97858928', 'Zeng Kai Hui', '2002-02-14', 'F');
INSERT INTO investor_signup VALUES('95766485', 'Chia Jia Wen', '2004-05-24', 'F');
INSERT INTO investor_signup VALUES('95067720', 'Liew Zhi Xin', '1998-02-14', 'F');
INSERT INTO investor_signup VALUES('95177723', 'Du Kai Xin', '2002-12-12', 'F');
INSERT INTO investor_signup VALUES('93641335', 'Ho Jia Xin', '1997-07-16', 'F');


/**
* Create table storing additional investor information
* These values should be NOT NULL, we assume that this behavour
* is enforced by TotalInvest
*
* Every phone_number in investor_add must belong to
* a phone_number in investor_signup (referential integrity).
* I set this as a foreign key to reference investor_signup
*
* Subsequently, we assume investors who provide additional information
* are not just "just signed up", as their information like annual income
* are used for determining financial goals for example. Therefore, 
* we shall classify them as "valid investors"
*
* Any tables that reference the phone_number shall reference
* to investor_valid
*
*
* Note that phone_number needs to be defined unique otherwise
* it will not act as a constraint
*/
CREATE TABLE investor_valid (
  email varchar(320) PRIMARY KEY,
  company_name varchar(255) NOT NULL,
  annual_income money NOT NULL,
  phone_number varchar(20) NOT NULL,
  CONSTRAINT FK_investor_valid_TO_investor_signup FOREIGN KEY (phone_number) REFERENCES investor_signup(phone_number),
  CONSTRAINT UQ_phone_number UNIQUE (phone_number)
);



/**
* To show the difference between investor_add and investor_signup
* Omitted John Wick, Quincy Yeo, Rita Lee, Simon Ho
*
*/

INSERT INTO investor_valid VALUES('alicetan85@yahoo.com', 'Morgan Stanley', 75000, '81232345');
INSERT INTO investor_valid VALUES('boblim1992@hotmail.com', 'Morgan Stanley', 68000, '93456789');
INSERT INTO investor_valid VALUES('cindylee1978@outlook.com', 'Citibank', 71000, '95551234');
INSERT INTO investor_valid VALUES('davidong1980@live.com', 'Citibank', 80000, '98765432');
INSERT INTO investor_valid VALUES('evachua1995@gmail.com', 'UBS', 72000, '90123456');
INSERT INTO investor_valid VALUES('fionatan87@aol.com', 'Citibank', 69000, '92226789');
INSERT INTO investor_valid VALUES('georgeho1990@outlook.com', 'DBS Bank', 74000, '96547890');
INSERT INTO investor_valid VALUES('hannahgoh2000@protonmail.com', 'OCBC Bank', 71000, '98324567');
INSERT INTO investor_valid VALUES('iancheong89@gmail.com', 'UBS', 65000, '94786234');
INSERT INTO investor_valid VALUES('jackylau1991@icloud.com', 'Standard Chartered', 78000, '89950123');
INSERT INTO investor_valid VALUES('karachia1988@yahoo.com', 'DBS Bank', 67000, '82340987');
INSERT INTO investor_valid VALUES('lennytan1993@live.com', 'Citibank', 71000, '97861234');
INSERT INTO investor_valid VALUES('megantay1997@aol.com', 'JPMorgan Chase', 74000, '90657890');
INSERT INTO investor_valid VALUES('ninakoh1982@gmail.com', 'DBS Bank', 76000, '93086574');
INSERT INTO investor_valid VALUES('oscartan1986@protonmail.com', 'OCBC Bank', 70000, '91430257');
INSERT INTO investor_valid VALUES('paullim1994@hotmail.com', 'UBS', 68000, '97543123');
/**
* additional records inserted for Q7
*/
INSERT INTO investor_valid VALUES('clayton92@gmail.com', 'OCBC Bank', 670000, '96827418');
INSERT INTO investor_valid VALUES('blakewood1@outlook.com', 'UBS', 71000, '81548849');
INSERT INTO investor_valid VALUES('behhh@qq.com', 'Morgan Stanley', 80000, '94798210');
INSERT INTO investor_valid VALUES('tyr123@protonmail.com', 'Morgan Stanley', 69000, '94612498');
INSERT INTO investor_valid VALUES('behkaide@e.ntu.edu.sg', 'Citibank', 59000, '86999698');
INSERT INTO investor_valid VALUES('chen002@e.ntu.edu.sg', 'JPMorgan Chase', 61000, '92347678');
INSERT INTO investor_valid VALUES('ykde@gmail.com', 'JPMorgan Chase', 88888, '81067405');
INSERT INTO investor_valid VALUES('gohjuncheng@gmail.com', 'UBS', 82000, '86408389');
INSERT INTO investor_valid VALUES('lam0122@gmail.com', 'OCBC Bank', 100000, '86916680');
INSERT INTO investor_valid VALUES('hongkaiming@e.ntu.edu.sg', 'DBS Bank', 120000, '92948260');

INSERT INTO investor_valid VALUES('enhuihui@gmail.com', 'OCBC Bank', 68000, '87346813');
INSERT INTO investor_valid VALUES('siwen12@gmail.com', 'UBS', 71000, '81241249');
INSERT INTO investor_valid VALUES('ssq72@outlook.com', 'Morgan Stanley', 810000, '86093078');
INSERT INTO investor_valid VALUES('xinen123@gmail.com', 'Morgan Stanley', 830000, '88597986');
INSERT INTO investor_valid VALUES('ruien59@naver.com', 'Citibank', 650000, '83248451');
INSERT INTO investor_valid VALUES('kaihuii@gmail.com', 'JPMorgan Chase', 139000, '97858928');
INSERT INTO investor_valid VALUES('jiaw911@e.ntu.edu.sg', 'JPMorgan Chase', 100000, '95766485');
INSERT INTO investor_valid VALUES('lzx1@gmail.com', 'UBS', 73100, '95067720');
INSERT INTO investor_valid VALUES('kaiaxinn1111@gmail.com', 'DBS Bank', 56000, '95177723');
INSERT INTO investor_valid VALUES('jiajia11@outlook.com', 'OCBC Bank', 58000, '93641335');



/**
* Create table for Weak Entity financial_goal
* 
* Primary Key: (phone_number, goal)
* unsued key: (phone_number, priority)
* this unused key is represented by the constraint unique
*
* Each investor can have ONE OR MORE goal
*
* For goals, let's first assume that users only can choose from a set of goals
* provided (to avoid strings of the same meaning but of different vaues because
* of cases e.g.)
*
*
* Note: the number of portfolio doesn't necessarily correspond to number of
* financial_goal, because it depends on whether the investor agrees to activate
* the portfolio. Therefore, the counts don't have to match.
*
* Additionally, the inception_date of portfolio doesn't have to correspond with
* financial_goal start_date, because investors don't have to agree to the
* porfolio immediately when they make the goal 
*
*
*/
CREATE TABLE financial_goal (
  phone_number varchar(20),
  goal varchar(255),
  amount money NOT NULL, 
  start_date date NOT NULL,
  goal_date date NOT NULL,
  priority int NOT NULL,
  CONSTRAINT PK_financial_goal PRIMARY KEY (phone_number, goal),
  CONSTRAINT FK_financial_goal_TO_investor_valid FOREIGN KEY (phone_number) REFERENCES investor_valid(phone_number),
  CONSTRAINT UQ_financial_goal UNIQUE (phone_number, priority)  
);

INSERT INTO financial_goal VALUES('81232345', 'to fund children''s education', 100000, '2024-01-01', '2034-01-01', 1);
INSERT INTO financial_goal VALUES('81232345', 'to fund holiday vacations', 5000, '2024-10-10', '2034-10-10', 2);
INSERT INTO financial_goal VALUES('81232345', 'to buy a car', 500000, '2024-10-10', '2034-10-10', 3);
INSERT INTO financial_goal VALUES('81232345', 'to buy a house', 10000000, '2024-10-10', '2034-10-10', 5);
INSERT INTO financial_goal VALUES('81232345', 'to fund retirement fund', 420000, '2024-10-10', '2054-10-10', 4);

INSERT INTO financial_goal VALUES ('93456789', 'to fund holiday vacations', 5000, '2024-08-10', '2028-08-10', 1);
INSERT INTO financial_goal VALUES('93456789', 'to fund retirement fund', 420000, '2024-10-10', '2060-08-10', 2);
INSERT INTO financial_goal VALUES('93456789', 'to buy a car', 500000, '2024-10-10', '2034-10-10', 3);
INSERT INTO financial_goal VALUES('93456789', 'to buy a house', 10000000, '2027-10-10', '2037-12-10', 4);

INSERT INTO financial_goal VALUES('95551234', 'to fund retirement fund', 500000, '2024-01-01', '2040-01-01', 1);
INSERT INTO financial_goal VALUES('95551234', 'to fund children''s education', 100000, '2024-03-03', '2027-12-01',2);
INSERT INTO financial_goal VALUES('95551234', 'to fund holiday vacations', 10000, '2024-04-04', '2030-01-01',3);

INSERT INTO financial_goal VALUES('98765432', 'to buy a house', 1000000, '2024-01-01', '2030-01-01', 1);
INSERT INTO financial_goal VALUES('98765432', 'to buy a car', 50000, '2024-06-06', '2026-06-06', 2);
INSERT INTO financial_goal VALUES('98765432', 'to fund holiday vacations', 5000, '2024-12-12', '2026-12-12', 3);

INSERT INTO financial_goal VALUES('90123456', 'to fund retirement fund', 420000, '2024-01-01', '2030-01-01', 1);

INSERT INTO financial_goal VALUES('92226789', 'to buy a car', 50000, '2024-01-01', '2028-01-01', 1);

INSERT INTO financial_goal VALUES('96547890', 'to fund holiday vacations', 5000, '2024-01-01', '2025-01-01', 1);
INSERT INTO financial_goal VALUES('96547890', 'to buy a car', 50000, '2024-06-06', '2028-06-06', 2);

INSERT INTO financial_goal VALUES('98324567', 'to fund retirement fund', 500000, '2024-01-01', '2030-01-01', 1);
INSERT INTO financial_goal VALUES('98324567', 'to fund holiday vacations', 10000, '2024-01-01', '2026-01-01', 2);
INSERT INTO financial_goal VALUES('98324567', 'to buy a car', 50000, '2025-01-01', '2030-01-01', 3);

INSERT INTO financial_goal VALUES('94786234', 'to buy a house', 1000000, '2024-01-01', '2035-01-01', 1);
INSERT INTO financial_goal VALUES('94786234', 'to fund retirement fund', 420000, '2024-01-01', '2045-01-01', 2);

INSERT INTO financial_goal VALUES('89950123', 'to buy a house', 1000000, '2024-01-01', '2035-01-01', 1);
INSERT INTO financial_goal VALUES('89950123', 'to buy a car', 50000, '2025-01-01', '2027-01-01', 2);

INSERT INTO financial_goal VALUES('82340987', 'to fund children''s education', 100000, '2024-01-01', '2030-01-01', 1);
INSERT INTO financial_goal VALUES('82340987', 'to fund holiday vacations', 5000, '2024-06-06', '2026-06-06', 2);
INSERT INTO financial_goal VALUES('82340987', 'to fund retirement fund', 420000, '2024-01-01', '2050-01-01', 3);

INSERT INTO financial_goal VALUES('97861234', 'to fund retirement fund', 420000, '2024-01-01', '2040-01-01', 1);

INSERT INTO financial_goal VALUES('90657890', 'to fund children''s education', 100000, '2024-01-01', '2030-01-01', 1);
INSERT INTO financial_goal VALUES('90657890', 'to fund holiday vacations', 5000, '2024-01-01', '2025-12-12', 2);
INSERT INTO financial_goal VALUES('90657890', 'to fund retirement fund', 100000, '2024-01-01', '2045-01-01', 3);

INSERT INTO financial_goal VALUES('93086574', 'to buy a house', 1000000, '2024-01-01', '2030-01-01', 1);
INSERT INTO financial_goal VALUES('93086574', 'to fund holiday vacations', 5000, '2024-01-01', '2027-01-01', 2);
INSERT INTO financial_goal VALUES('93086574', 'to buy a car', 50000, '2024-01-01', '2032-01-01', 3);

INSERT INTO financial_goal VALUES('91430257', 'to fund retirement fund', 420000, '2024-01-01', '2030-01-01', 1);

INSERT INTO financial_goal VALUES('97543123', 'to buy a house', 1000000, '2024-01-01', '2035-01-01', 1);
INSERT INTO financial_goal VALUES('97543123', 'to fund retirement fund', 420000, '2024-01-01', '2045-01-01', 2);


/**
* Create normalised table from WEAK ENTITY risk_tolerance, 
* stores phone_number as key 
*
*
* instead of storing answer, we will store it as a score 
*/
CREATE TABLE risk_tolerance_phone (
  phone_number varchar(20) PRIMARY KEY,
  q1_answer int NOT NULL CHECK (q1_answer IN (0, 1)),
  q2_answer int NOT NULL CHECK (q2_answer IN (0, 1)),
  q3_answer int NOT NULL CHECK (q3_answer IN (0, 1)),
  q4_answer int NOT NULL CHECK (q4_answer IN (0, 1)),
  q5_answer int NOT NULL CHECK (q5_answer IN (0, 1)),
  score AS (q1_answer + q2_answer + q3_answer + q4_answer + q5_answer),
  CONSTRAINT FK_risk_tolerance_phone_TO_investor_valid FOREIGN KEY (phone_number) REFERENCES investor_valid(phone_number)
);

INSERT INTO risk_tolerance_phone VALUES('81232345', 1, 0, 1, 1, 1);
INSERT INTO risk_tolerance_phone VALUES('93456789', 1, 1, 1, 1, 1);
INSERT INTO risk_tolerance_phone VALUES('95551234', 0, 0, 0, 0, 0);
INSERT INTO risk_tolerance_phone VALUES('98765432', 0, 1, 1, 1, 1);
INSERT INTO risk_tolerance_phone VALUES('90123456', 1, 1, 1, 0, 1);
INSERT INTO risk_tolerance_phone VALUES('92226789', 1, 1, 0, 1, 1);
INSERT INTO risk_tolerance_phone VALUES('96547890', 1, 0, 0, 0, 0);
INSERT INTO risk_tolerance_phone VALUES('98324567', 0, 1, 0, 1, 1);
INSERT INTO risk_tolerance_phone VALUES('94786234', 1, 0, 1, 1, 0);
INSERT INTO risk_tolerance_phone VALUES('89950123', 0, 0, 1, 1, 1);
INSERT INTO risk_tolerance_phone VALUES('82340987', 1, 1, 0, 1, 0);
INSERT INTO risk_tolerance_phone VALUES('97861234', 0, 1, 1, 1, 1);
INSERT INTO risk_tolerance_phone VALUES('90657890', 1, 1, 0, 0, 0);
INSERT INTO risk_tolerance_phone VALUES('93086574', 1, 1, 1, 0, 1);
INSERT INTO risk_tolerance_phone VALUES('91430257', 1, 1, 0, 1, 0);
INSERT INTO risk_tolerance_phone VALUES('97543123', 0, 1, 1, 1, 0);

/**
* Create normalised table from WEAK ENTITY risk tolerance, answer combination
* is the key.
*
* our own definition of survey
*
* score of 0 to 1: aggressive
* score of 2 to 3: moderate
* score of 4 to 5: conservative
*
* because we are only using 0 and 1, this captures all permutations
*
*
*/
CREATE TABLE risk_tolerance_risklvl (
  risk_level varchar(15) NOT NULL CHECK (risk_level IN ('conservative', 'moderate', 'aggressive')),
  q1_answer int NOT NULL CHECK (q1_answer IN (0, 1)),
  q2_answer int NOT NULL CHECK (q2_answer IN (0, 1)),
  q3_answer int NOT NULL CHECK (q3_answer IN (0, 1)),
  q4_answer int NOT NULL CHECK (q4_answer IN (0, 1)),
  q5_answer int NOT NULL CHECK (q5_answer IN (0, 1)),
  score AS (q1_answer + q2_answer + q3_answer + q4_answer + q5_answer),
  CONSTRAINT PK_risk_tolerance_risklvl PRIMARY KEY(q1_answer, q2_answer, q3_answer, q4_answer, q5_answer)
);

-- Aggressive (score 0 to 1)
INSERT INTO risk_tolerance_risklvl
VALUES
  ('aggressive', 0, 0, 0, 0, 0),
  ('aggressive', 1, 0, 0, 0, 0),
  ('aggressive', 0, 1, 0, 0, 0),
  ('aggressive', 0, 0, 1, 0, 0),
  ('aggressive', 0, 0, 0, 1, 0),
  ('aggressive', 0, 0, 0, 0, 1);

-- Moderate (score 2 to 3)
INSERT INTO risk_tolerance_risklvl
VALUES
  ('moderate', 1, 1, 0, 0, 0), -- score 2
  ('moderate', 1, 0, 1, 0, 0), -- score 2
  ('moderate', 1, 0, 0, 1, 0), -- score 2
  ('moderate', 1, 0, 0, 0, 1), -- score 2
  ('moderate', 0, 1, 1, 0, 0), -- score 2
  ('moderate', 0, 1, 0, 1, 0), -- score 2
  ('moderate', 0, 1, 0, 0, 1), -- score 2
  ('moderate', 0, 0, 1, 1, 0), -- score 2
  ('moderate', 0, 0, 1, 0, 1), -- score 2
  ('moderate', 0, 0, 0, 1, 1), -- score 2
  ('moderate', 1, 1, 1, 0, 0), -- score 3
  ('moderate', 1, 1, 0, 1, 0), -- score 3
  ('moderate', 1, 1, 0, 0, 1), -- score 3
  ('moderate', 1, 0, 1, 1, 0), -- score 3
  ('moderate', 1, 0, 1, 0, 1), -- score 3
  ('moderate', 1, 0, 0, 1, 1), -- score 3
  ('moderate', 0, 1, 1, 1, 0), -- score 3
  ('moderate', 0, 1, 1, 0, 1), -- score 3
  ('moderate', 0, 1, 0, 1, 1), -- score 3
  ('moderate', 0, 0, 1, 1, 1); -- score 3

-- Conservative (score 4 to 5)
INSERT INTO risk_tolerance_risklvl
VALUES
  ('conservative', 1, 1, 1, 1, 0), -- score 4
  ('conservative', 1, 1, 1, 0, 1), -- score 4
  ('conservative', 1, 1, 0, 1, 1), -- score 4
  ('conservative', 1, 0, 1, 1, 1), -- score 4
  ('conservative', 0, 1, 1, 1, 1), -- score 4
  ('conservative', 1, 1, 1, 1, 1); -- score 5


/**
* Create table for WEAK ENTITY portfolio
*/
CREATE TABLE portfolio (
  phone_number varchar(20),
  pid int,
  annualised_return decimal(5,2) NOT NULL,
  inception_date datetime, 
  market_value money,
  management_fee smallmoney,
  operational_status bit, 
  CONSTRAINT PK_portfolio PRIMARY KEY (phone_number, pid),
  CONSTRAINT FK_portfolio_TO_investor_valid FOREIGN KEY (phone_number) REFERENCES investor_valid(phone_number)
);


/** For demonstration purpose, each person has three portoflio.
*
* This is because in the ER diagram, they did not consider the point that each
* financial goal is tied to a portfolio.
*
*
* We will use ALTER TABLE to update the management_fee later automatically.
*/

-- Alice Tan
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('81232345', 1, -10.12, '2023-01-01 09:12:33', 1050000, 1);

INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('81232345', 2, 10.12, '2023-03-01 09:13:34', 1050000, 0); -- non-operational


-- Bob Lim
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('93456789', 1, 30.15, '2024-01-01 11:05:45', 1300000, 1);

INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('93456789', 2, 0.15, '2020-11-01 11:15:45', 10000, 0); -- non-operational



-- Cindy Lee
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('95551234', 1, -23.05, '2023-03-12 16:33:09', 870000, 1);

INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('95551234', 2, -3.05, '2020-03-12 16:33:19', 10000, 0); -- non-operational




-- David Ong
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('98765432', 1, 10.09, '2023-09-01 08:22:17', 1150000, 1);


-- Eva Chua
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('90123456', 1, 40.11, '2024-02-20 14:11:58', 1400000, 1);


-- Fiona Tan
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('92226789', 1, 20.05, '2023-08-01 17:09:04', 880000, 1);


-- George Ho
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('96547890', 1, 10.13, '2023-01-01 10:18:29', 990000, 1);


-- Hannah Goh
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('98324567', 1, 15.10, '2023-03-03 13:41:36', 1020000, 1);


-- Ian Cheong
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('94786234', 1, -20.02, '2022-11-11 12:57:48', 760000, 1);


-- Jacky Lau
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('89950123', 1, 30.14, '2021-01-15 09:45:10', 1260000, 1);


-- Kara Chia
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('82340987', 1, 19.03, '2023-04-04 18:03:28', 790000, 1);


-- Lenny Tan
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('97861234', 1, 3.07, '2023-06-01 07:30:55', 880000, 1);


-- Megan Tay
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('90657890', 1, 2.09, '2020-05-10 16:27:19', 1120000, 1);


-- Nina Koh
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('93086574', 1, 4.08, '2022-10-10 15:14:46', 990000, 1);


-- Oscar Tan
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('91430257', 1, 10.06, '2023-01-01 10:10:10', 870000, 1);


-- Paul Lim
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('97543123', 1, -20.04, '2023-07-07 19:52:11', 910000, 1);

-- Yang Kai De
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('81067405', 1, 15.25, '2021-12-12 10:15:45', 1100000, 1);

-- Zhuo Si Wen
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('81241249', 1, -5.45, '2023-11-01 08:30:33', 870000, 1);

-- Blake Wood
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('81548849', 1, 25.62, '2022-10-10 14:20:20', 1200000, 1);

-- How Rui En
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('83248451', 1, 12.36, '2022-09-01 08:30:55', 990000, 1);

-- Shen Shu Qi
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('86093078', 1, 3.77, '2023-08-15 11:12:10', 850000, 1);

-- Goh Jun Cheng
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('86408389', 1, 8.92, '2021-07-01 14:22:33', 930000, 1);

-- Lam Zi Rui
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('86916680', 1, 16.05, '2022-06-15 16:55:40', 1180000, 1);

-- Beh Kai De
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('86999698', 1, -1.25, '2023-05-01 10:45:01', 940000, 1);

-- Zhuo En Hui
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('87346813', 1, 22.14, '2022-04-05 13:11:20', 1150000, 1);

-- Qin Xin En
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('88597986', 1, 10.58, '2023-03-10 09:30:50', 1000000, 1);

-- Chen Kai Ming
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('92347678', 1, 4.77, '2021-02-25 12:12:25', 920000, 1);

-- Hong Kai Ming
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('92948260', 1, 13.50, '2020-01-18 11:00:45', 1150000, 1);

-- Ho Jia Xin
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('93641335', 1, 7.80, '2023-01-25 14:05:20', 980000, 1);

-- Teng Yong Rui
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('94612498', 1, -3.05, '2022-02-18 15:40:00', 910000, 1);

-- Beh De Kang
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('94798210', 1, 19.50, '2023-03-12 13:50:10', 1050000, 1);

-- Liew Zhi Xin
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('95067720', 1, 10.00, '2021-04-23 09:15:50', 930000, 1);

-- Du Kai Xin
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('95177723', 1, -4.20, '2023-05-30 11:25:33', 880000, 1);

-- Chia Jia Wen
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('95766485', 1, 6.85, '2023-06-10 12:30:15', 900000, 1);

-- Clyaton Hammond
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('96827418', 1, 14.35, '2023-07-05 10:10:50', 1070000, 1);

-- Zeng Kai Hui
INSERT INTO portfolio (phone_number, pid, annualised_return, inception_date, market_value, operational_status)
VALUES ('97858928', 1, 11.45, '2020-08-19 13:45:33', 1000000, 1);


/**
* Create table for WEAK ENTITY invested_value
* 
* attribute timestamp is changed to value_on
*
* note that users can update their invested value!
* therefore value_on represents the LATEST date,
* keep old entries!
*
* the LATEST invested_value (let's assume the current year is 2024)
* less the annualised return is the invested value.
*
* we will do this by using ALTER TABLE
* 
* at lest one of the invested_value should be the inception_date!!
*/
CREATE TABLE invested_value (
  value_on datetime,
  pid integer,
  phone_number varchar(20),
  amount money NOT NULL,
  CONSTRAINT PK_invested_value PRIMARY KEY (value_on, pid, phone_number),
  CONSTRAINT FK_invested_value_TO_portfolio FOREIGN KEY (phone_number, pid) REFERENCES portfolio(phone_number, pid),
);


INSERT INTO invested_value (phone_number, pid, value_on, amount)
SELECT
    p.phone_number,
    p.pid,
    p.inception_date AS value_on,
    p.market_value / (1 + p.annualised_return / 100) AS amount
FROM
    portfolio AS p
WHERE
  p.phone_number = '81067405' AND p.pid = 1 OR -- Yang Kai De
  p.phone_number = '81232345' AND p.pid = 1 OR -- Alice Tan
  p.phone_number = '81241249' AND p.pid = 1 OR -- Zhuo Si Wen
  p.phone_number = '81548849' AND p.pid = 1 OR -- Blake Wood
  p.phone_number = '82340987' AND p.pid = 1 OR -- Kara Chia
  p.phone_number = '83248451' AND p.pid = 1 OR -- How Rui En
  p.phone_number = '86093078' AND p.pid = 1 OR -- Shen Shu Qi
  p.phone_number = '86408389' AND p.pid = 1 OR -- Goh Jun Cheng
  p.phone_number = '86916680' AND p.pid = 1 OR -- Lam Zi Rui
  p.phone_number = '86999698' AND p.pid = 1 OR -- Beh Kai De
  p.phone_number = '87346813' AND p.pid = 1 OR -- Zhuo En Hui
  p.phone_number = '88597986' AND p.pid = 1 OR -- Qin Xin En
  p.phone_number = '89950123' AND p.pid = 1 OR -- Jacky Lau
  p.phone_number = '90123456' AND p.pid = 1 OR -- Eva Chua
  p.phone_number = '90657890' AND p.pid = 1 OR -- Megan Tay
  p.phone_number = '91430257' AND p.pid = 1 OR -- Oscar Tan
  p.phone_number = '92226789' AND p.pid = 1 OR -- Fiona Tan
  p.phone_number = '92347678' AND p.pid = 1 OR -- Chen Kai Ming
  p.phone_number = '92948260' AND p.pid = 1 OR -- Hong Kai Ming
  p.phone_number = '93086574' AND p.pid = 1 OR -- Nina Koh
  p.phone_number = '93456789' AND p.pid = 1 OR -- Bob Lim
  p.phone_number = '93641335' AND p.pid = 1 OR -- Ho Jia Xin
  p.phone_number = '94612498' AND p.pid = 1 OR -- Teng Yong Rui
  p.phone_number = '94786234' AND p.pid = 1 OR -- Ian Cheong
  p.phone_number = '94798210' AND p.pid = 1 OR -- Beh De Kang
  p.phone_number = '95067720' AND p.pid = 1 OR -- Liew Zhi Xin
  p.phone_number = '95177723' AND p.pid = 1 OR -- Du Kai Xin
  p.phone_number = '95551234' AND p.pid = 1 OR -- Cindy Lee
  p.phone_number = '95766485' AND p.pid = 1 OR -- Chia Jia Wen
  p.phone_number = '96547890' AND p.pid = 1 OR -- George Ho
  p.phone_number = '96827418' AND p.pid = 1 OR -- Clyaton Hammond
  p.phone_number = '97543123' AND p.pid = 1 OR -- Paul Lim
  p.phone_number = '97858928' AND p.pid = 1 OR -- Zeng Kai Hui
  p.phone_number = '97861234' AND p.pid = 1 OR -- Lenny Tan
  p.phone_number = '98324567' AND p.pid = 1 OR -- Hannah Goh
  p.phone_number = '98765432' AND p.pid = 1   -- David Ong
;


-- these are for Alice Tan, Bob Lim and Cindy Lee, to demonstrate
-- non-operational accounts with invested value = 0

-- (1) initial value on inception
-- these are values directly from how it was initialised initially

INSERT INTO invested_value VALUES ('2023-03-01 09:13:34', 2, '81232345', 1050000); -- Alice Tan
INSERT INTO invested_value VALUES ('2020-11-01 11:15:45', 2, '93456789', 10000); -- Bob Lim
INSERT INTO invested_value VALUES ('2020-03-12 16:33:19', 2, '95551234', 10000); -- Cindy Lee

-- (2) final value after withdrawal, set to 0, withdrawal all on 2024-01-01
-- 00:00:00, their pid is all 2

INSERT INTO invested_value VALUES ('2024-01-01 00:00:00', 2, '81232345', 0); -- Alice Tan
INSERT INTO invested_value VALUES ('2024-01-01 00:00:00', 2, '93456789', 0); -- Bob Lim
INSERT INTO invested_value VALUES ('2024-01-01 00:00:00', 2, '95551234', 0); -- Cindy Lee



CREATE TABLE unrealised_gain_loss (
  value_on datetime,
  pid integer,
  phone_number varchar(20),
  amount money,
  CONSTRAINT PK_unrealised_gain_loss PRIMARY KEY (value_on, pid, phone_number),
  CONSTRAINT FK_unrealised_gain_loss_TO_porfolio FOREIGN KEY (phone_number, pid) REFERENCES portfolio(phone_number, pid),
);



/**
* Asset classes
*/


CREATE TABLE asset_stock (
  asset_id varchar(20) PRIMARY KEY,
  name varchar(255),
  market_price money,
  pe_ratio decimal(5, 2),
  eps money,
  ebitda money,
  CONSTRAINT UQ_asset_stock UNIQUE (name)
);

INSERT INTO asset_stock VALUES('AAPL', 'Apple Inc.', 214.10, 34.5, 2.4, 137400000000);
INSERT INTO asset_stock VALUES('MSFT', 'Microsoft Corp', 386.84, 31.5, 3.23, 142905000000); 
INSERT INTO asset_stock VALUES('NVDA', 'Nvidia Corp', 118.53, 36.4, 3.26, 19000000000); 
INSERT INTO asset_stock VALUES('AMZN', 'Amazon.com Inc', 194.95, 25.7, 1.23, 58000000000); 
INSERT INTO asset_stock VALUES('META', 'Meta Platforms, Inc. Class A', 586.00, 23.5, 2.5, 40000000000); 
INSERT INTO asset_stock VALUES('BRK.B', 'Berkshire Hathaway Class B', 528.73, 8.5, 3.12, 65000000000); 
INSERT INTO asset_stock VALUES('GOOGL', 'Alphabet Inc. Class A', 162.80, 29.7, 5.48, 92000000000); 
INSERT INTO asset_stock VALUES('AVGO', 'Broadcom Inc.', 190.54, 21.3, 8.95, 13000000000); 
INSERT INTO asset_stock VALUES('GOOG', 'Alphabet Inc. Class C', 165.05, 29.7, 5.48, 92000000000); 
INSERT INTO asset_stock VALUES('JPM', 'Jpmorgan Chase & Co.', 239.01, 10.2, 3.78, 45000000000);



CREATE TABLE asset_bond (
  asset_id varchar(20) PRIMARY KEY,
  name varchar(255),
  market_price money,
  interest_rate decimal(5, 3),
  maturity_date date,
  CONSTRAINT UQ_asset_bond UNIQUE (name)
);

INSERT INTO asset_bond VALUES('SG31A8000003', 'NX16100F 2-year', 99.530, 2.520, '2026-02-01');
INSERT INTO asset_bond VALUES('SG31A7000004', 'NA16100H 20-year', 100.240, 2.730, '2046-03-01');
INSERT INTO asset_bond VALUES('SGXF75438295', 'NX24100T 10-year', 105.770, 2.660, '2034-05-01');
INSERT INTO asset_bond VALUES('SGXF12888537', 'N521100V 2-Year', 98.020, 2.510, '2026-11-01');
INSERT INTO asset_bond VALUES('SGXF13029610', 'NZ19100S 15-Year', 95.810, 2.730, '2039-07-01');
INSERT INTO asset_bond VALUES('SG3263998209', 'NY14100E 5-Year', 101.420, 2.520, '2029-07-01');
INSERT INTO asset_bond VALUES('SGXF47639806', 'NC22300W 50-Year', 105.220, 2.800, '2072-08-01');
INSERT INTO asset_bond VALUES('SGXF51035222', 'N523100W 5-Year', 101.250, 2.490, '2028-08-01');
INSERT INTO asset_bond VALUES('SG7J60932174', 'NZ07100S 2-Year', 101.940, 2.470, '2027-03-01');
INSERT INTO asset_bond VALUES('SGXF25686589', 'NX25100H 10-Year', 100.770, 2.660, '2035-03-01');


/**
* dividend_yield and expense_ratio are all percentages
*/
CREATE TABLE asset_fund (
  asset_id varchar(20) PRIMARY KEY,
  name varchar(255),
  market_price money,
  expense_ratio decimal(3, 2),
  dividend_yield decimal(3, 2), 
  CONSTRAINT UQ_asset_fund UNIQUE (name)
);

INSERT INTO asset_fund VALUES('VTSAX', 'Vanguard Total Stock Market Index Fund Admiral Shares', 115.00, 0.04, 1.50);
INSERT INTO asset_fund VALUES('VFIAX', 'Vanguard 500 Index Fund Admiral Shares', 350.00, 0.04, 1.80);
INSERT INTO asset_fund VALUES('FXAIX', 'Fidelity 500 Index Fund', 150.00, 0.015, 1.70);
INSERT INTO asset_fund VALUES('VTIAX', 'Vanguard Total International Stock Index Fund Admiral Shares', 30.00, 0.11, 2.00);
INSERT INTO asset_fund VALUES('VTBIX', 'Vanguard Total Bond Market II Index Fund', 11.00, 0.09, 2.50);
INSERT INTO asset_fund VALUES('VTSMX', 'Vanguard Total Stock Market Index Fund Investor Shares', 115.00, 0.17, 1.50);
INSERT INTO asset_fund VALUES('AGTHX', 'American Funds Growth Fund of America', 65.00, 0.68, 0.50);
INSERT INTO asset_fund VALUES('SPY', 'SPDR S&P 500 ETF Trust', 400.00, 0.09, 1.60);
INSERT INTO asset_fund VALUES('QQQ', 'Invesco QQQ Trust', 320.00, 0.20, 0.70);
INSERT INTO asset_fund VALUES('DODGX', 'Dodge & Cox Stock Fund', 250.00, 0.52, 1.30);


CREATE TABLE asset_others (
  asset_id varchar(20) PRIMARY KEY,
  name varchar(255),
  market_price money,
  CONSTRAINT UQ_asset_others UNIQUE (name)
);

INSERT INTO asset_others VALUES('GC=F', 'Gold Futures (Apr 2025)', 2150.00);
INSERT INTO asset_others VALUES('SI=F', 'Silver Futures (Apr 2025)', 25.30);
INSERT INTO asset_others VALUES('CL=F', 'Crude Oil WTI Futures (Apr 2025)', 80.50);
INSERT INTO asset_others VALUES('NG=F', 'Natural Gas Futures (Apr 2025)', 2.30);
INSERT INTO asset_others VALUES('BTC-USD', 'Bitcoin', 67000.00);
INSERT INTO asset_others VALUES('ETH-USD', 'Ethereum', 3600.00);
INSERT INTO asset_others VALUES('COFFEE=F', 'Coffee Futures (May 2025)', 190.00);
INSERT INTO asset_others VALUES('CORN=F', 'Corn Futures (May 2025)', 450.00);
INSERT INTO asset_others VALUES('PL=F', 'Platinum Futures (Apr 2025)', 900.00);
INSERT INTO asset_others VALUES('LUMBER=F', 'Lumber Futures (Apr 2025)', 540.00);


/**
* allocation_ratio has precision 0.XXX to 1.000 exclusive
*
* note that the ER diagram specified that 
* the individual id is a primary key
*
* for simplicity sake, let's check that one portfolio
* has exactly one stock, one bond, one fund.
*
* for initialisation purpose, let
* the start_date of each asset be 
* the inception_date of the portfolio
* 
*/

CREATE TABLE stock_in_portfolio (
  id int IDENTITY(1, 1) PRIMARY KEY,
  pid int NOT NULL,
  start_date datetime NOT NULL,
  allocation_ratio decimal(4, 3) NOT NULL CHECK (allocation_ratio > 0 AND allocation_ratio < 1),
  post_trade_co varchar(255),
  phone_number varchar(20),
  asset_id varchar(20),
  CONSTRAINT FK_stock_in_portfolio_TO_portfolio FOREIGN KEY (phone_number, pid) REFERENCES portfolio(phone_number, pid),
);


INSERT INTO stock_in_portfolio (phone_number, pid, asset_id, post_trade_co, start_date, allocation_ratio) 
  SELECT
    p.phone_number,
    p.pid,
    'AAPL' AS asset_id,
    'Vanguard' AS post_trade_co,
    p.inception_date AS start_date,
    0.5 AS allocation_ratio
  FROM
  portfolio AS p
  WHERE 
  p.phone_number = '81067405' AND p.pid = 1 OR -- Yang Kai De
  p.phone_number = '81232345' AND p.pid = 1 OR -- Alice Tan
  p.phone_number = '81241249' AND p.pid = 1 OR -- Zhuo Si Wen
  p.phone_number = '81548849' AND p.pid = 1 OR -- Blake Wood
  p.phone_number = '82340987' AND p.pid = 1 OR -- Kara Chia
  p.phone_number = '83248451' AND p.pid = 1 OR -- How Rui En
  p.phone_number = '86093078' AND p.pid = 1 OR -- Shen Shu Qi
  p.phone_number = '86408389' AND p.pid = 1 OR -- Goh Jun Cheng
  p.phone_number = '86916680' AND p.pid = 1 OR -- Lam Zi Rui
  p.phone_number = '86999698' AND p.pid = 1 OR -- Beh Kai De
  p.phone_number = '87346813' AND p.pid = 1 OR -- Zhuo En Hui
  p.phone_number = '88597986' AND p.pid = 1 OR -- Qin Xin En
  p.phone_number = '89950123' AND p.pid = 1 OR -- Jacky Lau
  p.phone_number = '90123456' AND p.pid = 1; -- Eva Chua


INSERT INTO stock_in_portfolio (phone_number, pid, asset_id, post_trade_co, start_date, allocation_ratio) 
  SELECT
    p.phone_number,
    p.pid,
    'AMZN' AS asset_id,
    'SGX' AS post_trade_co,
    p.inception_date AS start_date,
    0.5 AS allocation_ratio
  FROM
  portfolio AS p
  WHERE 
  p.phone_number = '90657890' AND p.pid = 1 OR -- Megan Tay
  p.phone_number = '91430257' AND p.pid = 1 OR -- Oscar Tan
  p.phone_number = '92226789' AND p.pid = 1 OR -- Fiona Tan
  p.phone_number = '92347678' AND p.pid = 1 OR -- Chen Kai Ming
  p.phone_number = '92948260' AND p.pid = 1 OR -- Hong Kai Ming
  p.phone_number = '93086574' AND p.pid = 1 OR -- Nina Koh
  p.phone_number = '93456789' AND p.pid = 1 OR -- Bob Lim
  p.phone_number = '93641335' AND p.pid = 1 OR -- Ho Jia Xin
  p.phone_number = '94612498' AND p.pid = 1 OR -- Teng Yong Rui
  p.phone_number = '94786234' AND p.pid = 1 OR -- Ian Cheong
  p.phone_number = '94798210' AND p.pid = 1 OR -- Beh De Kang
  p.phone_number = '95067720' AND p.pid = 1 OR -- Liew Zhi Xin
  p.phone_number = '95177723' AND p.pid = 1; -- Du Kai Xin


INSERT INTO stock_in_portfolio (phone_number, pid, asset_id, post_trade_co, start_date, allocation_ratio) 
  SELECT
    p.phone_number,
    p.pid,
    'NVDA' AS asset_id,
    'Moomoo' AS post_trade_co,
    p.inception_date AS start_date,
    0.5 AS allocation_ratio
  FROM
  portfolio AS p
  WHERE 
  p.phone_number = '95551234' AND p.pid = 1 OR -- Cindy Lee
  p.phone_number = '95766485' AND p.pid = 1 OR -- Chia Jia Wen
  p.phone_number = '96547890' AND p.pid = 1 OR -- George Ho
  p.phone_number = '96827418' AND p.pid = 1 OR -- Clyaton Hammond
  p.phone_number = '97543123' AND p.pid = 1 OR -- Paul Lim
  p.phone_number = '97858928' AND p.pid = 1 OR -- Zeng Kai Hui
  p.phone_number = '97861234' AND p.pid = 1 OR -- Lenny Tan
  p.phone_number = '98324567' AND p.pid = 1 OR -- Hannah Goh
  p.phone_number = '98765432' AND p.pid = 1; -- David Ong


/**
* The following is to show non-operational accounts for
* ALice Tan pid = 2
* Bob Lim pid = 2
* Cindy Lee pid = 2
*
*
* 1) insert into the stock the inception date to initialise (stock_in_portfolio)
* 2) add the record in purchase (transaction_stock)
* 3) add the record in withdrawal (transaction_stock)
*
* following 0.5 stock, 0.3 bond, o.2 fund
*/

INSERT INTO stock_in_portfolio (phone_number, pid, asset_id, post_trade_co, start_date, allocation_ratio) 
  SELECT
    p.phone_number,
    p.pid,
    'JPM' AS asset_id,
    'Moomoo' AS post_trade_co,
    p.inception_date AS start_date,
    0.5 AS allocation_ratio
  FROM
  portfolio AS p
  WHERE 
  p.phone_number = '95551234' AND p.pid = 2 OR -- Cindy Lee
  p.phone_number = '81232345' AND p.pid = 2 OR -- Alice Tan
  p.phone_number = '93456789' AND p.pid = 2; -- Bob Lim


CREATE TABLE bond_in_portfolio (
  id int IDENTITY(1,1) PRIMARY KEY,
  pid int,
  start_date datetime NOT NULL,
  allocation_ratio decimal(4, 3) NOT NULL CHECK (allocation_ratio > 0 AND allocation_ratio < 1),
  post_trade_co varchar(255),
  phone_number varchar(20),
  asset_id varchar(20),
  CONSTRAINT FK_bond_in_portfolio_TO_portfolio FOREIGN KEY (phone_number, pid) REFERENCES portfolio(phone_number, pid),
);



/**
* The following is to show non-operational accounts for
* ALice Tan pid = 2
* Bob Lim pid = 2
* Cindy Lee pid = 2
*
*
* 1) insert into the bond the inception date to initialise (bond_in_portfolio)
* 2) add the record in purchase (transaction_bond)
* 3) add the record in withdrawal (transaction_bond)
*
* following 0.5 stock, 0.3 bond, o.2 fund
*/

INSERT INTO bond_in_portfolio (phone_number, pid, asset_id, post_trade_co, start_date, allocation_ratio) 
  SELECT
    p.phone_number,
    p.pid,
    'SG31A8000003' AS asset_id,
    'SGX' AS post_trade_co,
    p.inception_date AS start_date,
    0.3 AS allocation_ratio
  FROM
  portfolio AS p
  WHERE 
  p.phone_number = '95551234' AND p.pid = 2 OR -- Cindy Lee
  p.phone_number = '81232345' AND p.pid = 2 OR -- Alice Tan
  p.phone_number = '93456789' AND p.pid = 2; -- Bob Lim



CREATE TABLE fund_in_portfolio (
  id int IDENTITY(1,1) PRIMARY KEY,
  pid int NOT NULL,
  start_date datetime NOT NULL,
  allocation_ratio decimal(4, 3) NOT NULL CHECK (allocation_ratio > 0 AND allocation_ratio < 1),
  post_trade_co varchar(255),
  phone_number varchar(20),
  asset_id varchar(20),
  CONSTRAINT FK_fund_in_portfolio_TO_portfolio FOREIGN KEY (phone_number, pid) REFERENCES portfolio(phone_number, pid),
  CONSTRAINT FK_fund_in_portfolio_TO_asset_fund FOREIGN KEY (asset_id) REFERENCES asset_fund(asset_id)
);



INSERT INTO fund_in_portfolio (phone_number, pid, asset_id, post_trade_co, start_date, allocation_ratio) 
  SELECT
    p.phone_number,
    p.pid,
    'AGTHX' AS asset_id,
    'Moomoo' AS post_trade_co,
    p.inception_date AS start_date,
    0.2 AS allocation_ratio
  FROM
  portfolio AS p
  WHERE 
    (p.phone_number = '81067405' AND p.pid = 1) OR -- Yang Kai De
    (p.phone_number = '81232345' AND p.pid = 1) OR -- Alice Tan
    (p.phone_number = '81241249' AND p.pid = 1) OR -- Zhuo Si Wen
    (p.phone_number = '81548849' AND p.pid = 1) OR -- Blake Wood
    (p.phone_number = '82340987' AND p.pid = 1) OR -- Kara Chia
    (p.phone_number = '83248451' AND p.pid = 1) OR -- How Rui En
    (p.phone_number = '86093078' AND p.pid = 1) OR -- Shen Shu Qi
    (p.phone_number = '86408389' AND p.pid = 1) OR -- Goh Jun Cheng
    (p.phone_number = '86916680' AND p.pid = 1) OR -- Lam Zi Rui
    (p.phone_number = '86999698' AND p.pid = 1) OR -- Beh Kai De
    (p.phone_number = '87346813' AND p.pid = 1) OR -- Zhuo En Hui
    (p.phone_number = '88597986' AND p.pid = 1) OR -- Qin Xin En
    (p.phone_number = '89950123' AND p.pid = 1) OR -- Jacky Lau
    (p.phone_number = '90123456' AND p.pid = 1); -- Eva Chua
 


INSERT INTO fund_in_portfolio (phone_number, pid, asset_id, post_trade_co, start_date, allocation_ratio) 
  SELECT
    p.phone_number,
    p.pid,
    'DODGX' AS asset_id,
    'Saxo' AS post_trade_co,
    p.inception_date AS start_date,
    0.2 AS allocation_ratio
  FROM
  portfolio AS p
  WHERE 
    (p.phone_number = '90657890' AND p.pid = 1) OR -- Megan Tay
    (p.phone_number = '91430257' AND p.pid = 1) OR -- Oscar Tan
    (p.phone_number = '92226789' AND p.pid = 1) OR -- Fiona Tan
    (p.phone_number = '92347678' AND p.pid = 1) OR -- Chen Kai Ming
    (p.phone_number = '92948260' AND p.pid = 1) OR -- Hong Kai Ming
    (p.phone_number = '93086574' AND p.pid = 1) OR -- Nina Koh
    (p.phone_number = '93456789' AND p.pid = 1) OR -- Bob Lim
    (p.phone_number = '93641335' AND p.pid = 1) OR -- Ho Jia Xin
    (p.phone_number = '94612498' AND p.pid = 1) OR -- Teng Yong Rui
    (p.phone_number = '94786234' AND p.pid = 1) OR -- Ian Cheong
    (p.phone_number = '94798210' AND p.pid = 1) OR -- Beh De Kang
    (p.phone_number = '95067720' AND p.pid = 1) OR -- Liew Zhi Xin
    (p.phone_number = '95177723' AND p.pid = 1) OR -- Du Kai Xin
    (p.phone_number = '95551234' AND p.pid = 1);   -- Cindy Lee



INSERT INTO fund_in_portfolio (phone_number, pid, asset_id, post_trade_co, start_date, allocation_ratio) 
  SELECT
    p.phone_number,
    p.pid,
    'SPY' AS asset_id,
    'DBS Bank' AS post_trade_co,
    p.inception_date AS start_date,
    0.2 AS allocation_ratio
  FROM
  portfolio AS p
  WHERE 
    (p.phone_number = '95766485' AND p.pid = 1) OR -- Chia Jia Wen
    (p.phone_number = '96547890' AND p.pid = 1) OR -- George Ho
    (p.phone_number = '96827418' AND p.pid = 1) OR -- Clayton Hammond
    (p.phone_number = '97543123' AND p.pid = 1) OR -- Paul Lim
    (p.phone_number = '97858928' AND p.pid = 1) OR -- Zeng Kai Hui
    (p.phone_number = '97861234' AND p.pid = 1) OR -- Lenny Tan
    (p.phone_number = '98324567' AND p.pid = 1) OR -- Hannah Goh
    (p.phone_number = '98765432' AND p.pid = 1);   -- David Ong
 


/**
* The following is to show non-operational accounts for
* ALice Tan pid = 2
* Bob Lim pid = 2
* Cindy Lee pid = 2
*
*
* 1) insert into the bond the inception date to initialise (fund_in_portfolio)
* 2) add the record in purchase (transaction_fund)
* 3) add the record in withdrawal (transaction_fund)
*
* following 0.5 stock, 0.3 bond, o.2 fund
*/

INSERT INTO fund_in_portfolio (phone_number, pid, asset_id, post_trade_co, start_date, allocation_ratio) 
  SELECT
    p.phone_number,
    p.pid,
    'QQQ' AS asset_id,
    'Vanguard' AS post_trade_co,
    p.inception_date AS start_date,
    0.3 AS allocation_ratio
  FROM
  portfolio AS p
  WHERE 
  p.phone_number = '95551234' AND p.pid = 2 OR -- Cindy Lee
  p.phone_number = '81232345' AND p.pid = 2 OR -- Alice Tan
  p.phone_number = '93456789' AND p.pid = 2; -- Bob Lim



/**
* Transactions 
*
* To answer Q5 requires top up
*/


CREATE TABLE transaction_stock (
  occurred_on datetime,
  id int, -- stock in portfolio id
  type varchar(20) CHECK (type IN ('purchase', 'topup', 'withdrawal', 'management', 'rebalance')),
  fee money,
  CONSTRAINT PK_transaction_stock PRIMARY KEY (occurred_on, id),
  CONSTRAINT FK_transaction_stock_TO_stock_in_portfolio FOREIGN KEY (id) REFERENCES stock_in_portfolio(id)
);



/**
* The following is to show non-operational accounts for
* ALice Tan pid = 2
* Bob Lim pid = 2
* Cindy Lee pid = 2
*
*
* 1) insert into the stock the inception date to initialise (stock_in_portfolio)
* 2) add the record in purchase (transaction_stock)
* 3) add the record in withdrawal (transaction_stock)
*
* following 0.5 stock, 0.3 bond, o.2 fund
*/

-- (2) purchase, they should have fee 0
INSERT INTO transaction_stock (occurred_on, id,type, fee) -- because we fixed pid = 2 for the above to be invalid, these always work
SELECT
    p.inception_date AS occurred_on,
    s.id AS id,
    'purchase' AS type,
    0 AS fee
FROM
  portfolio AS p, stock_in_portfolio AS s
WHERE
  s.phone_number = '81232345' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Alice Tan
  s.phone_number = '93456789' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Bob Lim
  s.phone_number = '95551234' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number; -- Cindy Lee

-- (3) withdrawal, they should have fee 0, fix them all to the standard time
INSERT INTO transaction_stock (occurred_on, id,type, fee) -- because we fixed pid = 2 for the above to be invalid, these always work
SELECT
    '2024-01-01 00:00:00' AS occurred_on,
    s.id AS id,
    'withdrawal' AS type,
    0 AS fee
FROM
  portfolio AS p, stock_in_portfolio AS s
WHERE
  s.phone_number = '81232345' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Alice Tan
  s.phone_number = '93456789' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Bob Lim
  s.phone_number = '95551234' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number; -- Cindy Lee




CREATE TABLE transaction_bond (
  occurred_on datetime,
  id int, -- bond in porfolio id
  type varchar(20) CHECK (type IN ('purchase', 'topup', 'withdrawal', 'management', 'rebalance')),
  fee money,
  CONSTRAINT PK_transaction_bond PRIMARY KEY (occurred_on, id),
  CONSTRAINT FK_transaction_bond_TO_bond_in_portfolio FOREIGN KEY (id) REFERENCES bond_in_portfolio(id)
);


/**
* The following is to show non-operational accounts for
* ALice Tan pid = 2
* Bob Lim pid = 2
* Cindy Lee pid = 2
*
*
* 1) insert into the bond the inception date to initialise (bond_in_portfolio)
* 2) add the record in purchase (transaction_bond)
* 3) add the record in withdrawal (transaction_bond)
*
* following 0.5 stock, 0.3 bond, o.2 fund
*/

-- (2) purchase, they should have fee 0
INSERT INTO transaction_bond (occurred_on, id,type, fee) -- because we fixed pid = 2 for the above to be invalid, these always work
SELECT
    p.inception_date AS occurred_on,
    s.id AS id,
    'purchase' AS type,
    0 AS fee
FROM
  portfolio AS p, bond_in_portfolio AS s
WHERE
  s.phone_number = '81232345' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Alice Tan
  s.phone_number = '93456789' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Bob Lim
  s.phone_number = '95551234' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number; -- Cindy Lee

-- (3) withdrawal, they should have fee 0, fix them all to the standard time
INSERT INTO transaction_bond (occurred_on, id,type, fee) -- because we fixed pid = 2 for the above to be invalid, these always work
SELECT
    '2024-01-01 00:00:00' AS occurred_on,
    s.id AS id,
    'withdrawal' AS type,
    0 AS fee
FROM
  portfolio AS p, bond_in_portfolio AS s
WHERE
  s.phone_number = '81232345' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Alice Tan
  s.phone_number = '93456789' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Bob Lim
  s.phone_number = '95551234' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number; -- Cindy Lee




CREATE TABLE transaction_fund (
  occurred_on datetime,
  id int, -- fund in portfolio id
  type varchar(20) CHECK (type IN ('purchase', 'topup', 'withdrawal', 'management', 'rebalance')),
  fee money,
  CONSTRAINT PK_transaction_fund PRIMARY KEY (occurred_on, id),
  CONSTRAINT FK_transaction_fund_TO_fund_in_portfolio FOREIGN KEY (id) REFERENCES fund_in_portfolio(id)
);

/**
* The following is to show non-operational accounts for
* ALice Tan pid = 2
* Bob Lim pid = 2
* Cindy Lee pid = 2
*
*
* 1) insert into the bond the inception date to initialise (fund_in_portfolio)
* 2) add the record in purchase (transaction_fund)
* 3) add the record in withdrawal (transaction_fund)
*
* following 0.5 stock, 0.3 bond, o.2 fund
*/


-- (2) purchase, they should have fee 0
INSERT INTO transaction_fund (occurred_on, id,type, fee) -- because we fixed pid = 2 for the above to be invalid, these always work
SELECT
    p.inception_date AS occurred_on,
    s.id AS id,
    'purchase' AS type,
    0 AS fee
FROM
  portfolio AS p, fund_in_portfolio AS s
WHERE
  s.phone_number = '81232345' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Alice Tan
  s.phone_number = '93456789' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Bob Lim
  s.phone_number = '95551234' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number; -- Cindy Lee

-- (3) withdrawal, they should have fee 0, fix them all to the standard time
INSERT INTO transaction_fund (occurred_on, id,type, fee) -- because we fixed pid = 2 for the above to be invalid, these always work
SELECT
    '2024-01-01 00:00:00' AS occurred_on,
    s.id AS id,
    'withdrawal' AS type,
    0 AS fee
FROM
  portfolio AS p, fund_in_portfolio AS s
WHERE
  s.phone_number = '81232345' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Alice Tan
  s.phone_number = '93456789' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number OR -- Bob Lim
  s.phone_number = '95551234' AND s.pid = 2 AND s.pid = p.pid AND p.phone_number = s.phone_number; -- Cindy Lee


