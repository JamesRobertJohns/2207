/**
* ---------------------
*| IMPORTANT MESSAGES |
*----------------------
* 1) Note that the order matters when REFERENCE, ollow the previous examples when in doubt
* 2) The order in which the tables are created matters, as we are specifying constraints to ensure
* referential integrity
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
INSERT INTO investor_signup VALUES('98324567', 'Hannah Goh', '2000-04-18', 'F');
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
*/
INSERT INTO investor_valid VALUES('alicetan85@yahoo.com', 'Goldman Sachs', 750000, '81232345');
INSERT INTO investor_valid VALUES('boblim1992@hotmail.com', 'Morgan Stanley', 680000, '93456789');
INSERT INTO investor_valid VALUES('cindylee1978@outlook.com', 'Barclays', 710000, '95551234');
INSERT INTO investor_valid VALUES('davidong1980@live.com', 'HSBC', 800000, '98765432');
INSERT INTO investor_valid VALUES('evachua1995@gmail.com', 'UBS', 720000, '90123456');
INSERT INTO investor_valid VALUES('fionatan87@aol.com', 'Citibank', 690000, '92226789');
INSERT INTO investor_valid VALUES('georgeho1990@outlook.com', 'DBS Bank', 740000, '96547890');
INSERT INTO investor_valid VALUES('hannahgoh2000@protonmail.com', 'OCBC Bank', 710000, '98324567');
INSERT INTO investor_valid VALUES('iancheong89@gmail.com', 'RBC', 650000, '94786234');
INSERT INTO investor_valid VALUES('jackylau1991@icloud.com', 'Standard Chartered', 780000, '89950123');
INSERT INTO investor_valid VALUES('karachia1988@yahoo.com', 'Maybank', 670000, '82340987');
INSERT INTO investor_valid VALUES('lennytan1993@live.com', 'Citi', 710000, '97861234');
INSERT INTO investor_valid VALUES('megantay1997@aol.com', 'JPMorgan Chase', 740000, '90657890');
INSERT INTO investor_valid VALUES('ninakoh1982@gmail.com', 'DBS', 760000, '93086574');
INSERT INTO investor_valid VALUES('oscartan1986@protonmail.com', 'OCBC', 700000, '91430257');
INSERT INTO investor_valid VALUES('paullim1994@hotmail.com', 'HSBC', 680000, '97543123');



/**
* Create table for Weak Entity financial_goal
* 
* Primary Key: (phone_number, goal)
* unsued key: (phone_number, priority)
* this unused key is represented by the constraint unique
*
* Each investor can have ONE OR MORE goal
*
* For goals, let's first assume that users only can choose
* from a set of goals provided (to avoid strings of the same meaning
* but of different vaues because of cases e.g.)
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
  CONSTRAINT UQ_financial_goal UNIQUE (priority)  
);

/**
* Currently only specify for Alice Tan
* because we may change the whole thing depends on discussion
*/
INSERT INTO financial_goal VALUES('81232345', 'to fund children''s education', '100000', '2024-01-01', '2034-01-01', 1);
INSERT INTO financial_goal VALUES('81232345', 'to fund holiday vacations', '5000', '2024-10-10', '2034-10-10', 2);
INSERT INTO financial_goal VALUES('81232345', 'to buy a car', '500000', '2024-10-10', '2034-10-10', 3);
INSERT INTO financial_goal VALUES('81232345', 'to buy a house', '10000000', '2024-10-10', '2034-10-10', 5);
INSERT INTO financial_goal VALUES('81232345', 'to fund retirement fund', '420000', '2024-10-10', '2054-10-10', 4);


/**
* Create normalised table from WEAK ENTITY risk_tolerance, 
* stores phone_number as key 
*
*/
CREATE TABLE risk_tolerance_phone (
  phone_number varchar(20) PRIMARY KEY,
  q1_answer varchar(255) NOT NULL,
  q2_answer varchar(255) NOT NULL,
  q3_answer varchar(255) NOT NULL,
  q4_answer varchar(255) NOT NULL,
  q5_answer varchar(255) NOT NULL,
  CONSTRAINT FK_risk_tolerance_phone_TO_investor_valid FOREIGN KEY (phone_number) REFERENCES investor_valid(phone_number)
);

/**
* TO-DO: create records
*/

/**
* Create normalised table from WEAK ENTITY risk tolerance,
* stores risk_level as key
*/
CREATE TABLE risk_tolerance_risklvl (
  risk_level varchar(15) NOT NULL CHECK (risk_level IN ('conservative', 'moderate', 'aggressive')),
  q1_answer varchar(255),
  q2_answer varchar(255),
  q3_answer varchar(255),
  q4_answer varchar(255),
  q5_answer varchar(255),
  CONSTRAINT PK_risk_tolerance_risklvl PRIMARY KEY(q1_answer, q2_answer, q3_answer, q4_answer, q5_answer),
);

/**
* TO-DO: create records
*/



/**
* Create table for WEAK ENTITY portfolio
*/
CREATE TABLE portfolio (
  phone_number varchar(20),
  pid int,
  annualised_return money NOT NULL,
  inception_date datetime, 
  market_value money,
  management_fee smallmoney,
  operational_status binary(1), 
  CONSTRAINT PK_portfolio PRIMARY KEY (phone_number, pid),
  CONSTRAINT FK_portfolio_TO_investor_valid FOREIGN KEY (phone_number) REFERENCES investor_valid(phone_number)
);


/**
* TO-DO: create records
*/


/**
* Create table for WEAK ENTITY invested_value
* 
* attribute timestamp is changed to value_on
*/
CREATE TABLE invested_value (
  value_on datetime,
  pid integer,
  phone_number varchar(20),
  amount money NOT NULL,
  CONSTRAINT PK_invested_value PRIMARY KEY (value_on, pid, phone_number),
  CONSTRAINT FK_invested_value_TO_portfolio FOREIGN KEY (phone_number, pid) REFERENCES portfolio(phone_number, pid),
);


/**
* TO-DO: create records
*/


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
*/
CREATE TABLE stock_in_portfolio (
  id int PRIMARY KEY,
  pid int,
  start_date datetime NOT NULL,
  allocation_ratio decimal(4, 3) NOT NULL CHECK (allocation_ratio > 0 AND allocation_ratio < 1),
  post_trade_co varchar(255),
  phone_number varchar(20),
  asset_id varchar(20),
  CONSTRAINT FK_stock_in_portfolio_TO_portfolio FOREIGN KEY (phone_number, pid) REFERENCES portfolio(phone_number, pid),
);



CREATE TABLE bond_in_portfolio (
  id int PRIMARY KEY,
  pid int,
  start_date datetime NOT NULL,
  allocation_ratio decimal(4, 3) NOT NULL CHECK (allocation_ratio > 0 AND allocation_ratio < 1),
  post_trade_co varchar(255),
  phone_number varchar(20),
  asset_id varchar(20),
  CONSTRAINT FK_bond_in_portfolio_TO_portfolio FOREIGN KEY (phone_number, pid) REFERENCES portfolio(phone_number, pid),
);



CREATE TABLE fund_in_portfolio (
  id int PRIMARY KEY,
  pid int,
  start_date datetime NOT NULL,
  allocation_ratio decimal(4, 3) NOT NULL CHECK (allocation_ratio > 0 AND allocation_ratio < 1),
  post_trade_co varchar(255),
  phone_number varchar(20),
  asset_id varchar(20),
  CONSTRAINT FK_fund_in_portfolio_TO_portfolio FOREIGN KEY (phone_number, pid) REFERENCES portfolio(phone_number, pid),
  CONSTRAINT FK_fund_in_portfolio_TO_asset_fund FOREIGN KEY (asset_id) REFERENCES asset_fund(asset_id)
);


/**
* Transactions 
*/

CREATE TABLE transaction_stock (
  occurred_on datetime,
  id int,
  type varchar(20) CHECK (type IN ('topup', 'withdrawal', 'management', 'rebalance')),
  CONSTRAINT PK_transaction_stock PRIMARY KEY (occurred_on, id),
  CONSTRAINT FK_transaction_stock_TO_stock_in_portfolio FOREIGN KEY (id) REFERENCES stock_in_portfolio(id)
);



CREATE TABLE transaction_bond (
  occurred_on datetime,
  id int,
  type varchar(20) CHECK (type IN ('topup', 'withdrawal', 'management', 'rebalance')),
  CONSTRAINT PK_transaction_bond PRIMARY KEY (occurred_on, id),
  CONSTRAINT FK_transaction_bond_TO_bond_in_portfolio FOREIGN KEY (id) REFERENCES bond_in_portfolio(id)
);




CREATE TABLE transaction_fund (
  occurred_on datetime,
  id int,
  type varchar(20) CHECK (type IN ('topup', 'withdrawal', 'management', 'rebalance')),
  CONSTRAINT PK_transaction_fund PRIMARY KEY (occurred_on, id),
  CONSTRAINT FK_transaction_fund_TO_fund_in_portfolio FOREIGN KEY (id) REFERENCES fund_in_portfolio(id)
);



