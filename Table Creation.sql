CREATE TABLE User_Account(
   UID INT PRIMARY KEY,
   Gender VARCHAR(10),
   DOB DATE,
   Name VARCHAR(100)
);

CREATE TABLE Mall_Mgmt_Company(
CompanyID int,
Company_Address varchar(150),
Mall_Mgt_Name varchar(150),
primary key (CompanyID)
);

CREATE TABLE Mall(
MallID int,
M_Address varchar(150),
MallName varchar(50),
NumShops int,
CompanyID int,
primary key (MallID),
foreign key (CompanyID) References Mall_Mgmt_Company(CompanyID) 
);

CREATE TABLE Complaint(
CID INT,
Status varchar(20),
Text varchar(255),
Filed_date_time DATETIME
primary key(CID)
);

CREATE TABLE Shop(
ShopID int,
ShopType varchar(20),
MallID int,
primary key (ShopID),
foreign key (MallID) References Mall(MallID) 
);

CREATE TABLE Complaint_on_Shop(
CID int, /*CID stands for ComplaintID*/
ShopID int,
primary key(CID), /*ensure there is no duplicate of CID, ShopID*/
foreign key (CID) references Complaint(CID),
foreign key (ShopID) references Shop(ShopID)
);

CREATE TABLE Restaurant_Chain(
RestChainID int,
RestChainName varchar(100),
RestAddress varchar(150),
primary key (RestChainID)
);

CREATE TABLE Restaurant_Outlet(
OutletID int,
RestChainID int,
MallID int,
primary key (OutletID),
foreign key (RestChainID) references Restaurant_Chain(RestChainID),
foreign key (MallID) references Mall(MallID)
);

CREATE TABLE Complaint_on_Restaurant(
CID int, /*CID stands for ComplaintID*/
OutletID int,
primary key (CID),
foreign key (CID) references Complaint(CID),
foreign key (OutletID) references Restaurant_Outlet(OutletID)
);

CREATE TABLE DayPackage (
   DID INT PRIMARY KEY,
   Description VARCHAR(255),
);

CREATE TABLE Signup_Package (
   UID INT,
   DID INT,
   PRIMARY KEY (UID, DID),
   FOREIGN KEY (UID) REFERENCES User_Account(UID),
   FOREIGN KEY (DID) REFERENCES DayPackage(DID)
);

CREATE TABLE Related (
   Person1UID INT,
   Person2UID INT,
   Type VARCHAR(255),
   PRIMARY KEY (Person1UID, Person2UID),
   FOREIGN KEY (Person1UID) REFERENCES User_Account(UID),
   FOREIGN KEY (Person2UID) REFERENCES User_Account(UID)
);

CREATE TABLE Voucher (
   VID INT,
   Descriptions VARCHAR(100), 
   Date_Issued DATE, 
   Expired_Date DATE, 
   V_Status VARCHAR(20),
   PRIMARY KEY (VID)
);

CREATE TABLE GroupVoucher (
   VID INT,
   GroupSize INT,
   GroupDiscount INT,
   DateTimeUsed DATETIME,
   UID INT,
   PRIMARY KEY (VID),
   FOREIGN KEY (VID) REFERENCES Voucher(VID),
   FOREIGN KEY (UID) REFERENCES User_Account(UID)
);

CREATE TABLE PackageVoucher (
   VID INT PRIMARY KEY,
   PackageDiscount INT,
   DID INT,
   FOREIGN KEY (DID) REFERENCES DayPackage(DID),
   FOREIGN KEY (VID) REFERENCES Voucher(VID)
);

CREATE TABLE DineVoucher (
   VID INT,
   CashDiscount INT,
   DateTimeUsed DATETIME,
   UID INT,
   PRIMARY KEY (VID),
   FOREIGN KEY (VID) REFERENCES Voucher(VID),
   FOREIGN KEY (UID) REFERENCES User_Account(UID)
);

CREATE TABLE PurchaseVoucher (
   VID INT,
   PurchaseDiscount INT,
   DateTimeUsed DATETIME,
   UID INT,
   PRIMARY KEY (VID),
   FOREIGN KEY (VID) REFERENCES Voucher(VID),
   FOREIGN KEY (UID) REFERENCES User_Account(UID)
);

CREATE TABLE Shopping (
   SID INT,
   UID INT,
   AmountSpent FLOAT,
   DateTimeIn DATETIME,
   DateTimeOut DATETIME,
   PRIMARY KEY (DateTimeIn, UID),
   FOREIGN KEY (UID) REFERENCES User_Account(UID),
   FOREIGN KEY (SID) REFERENCES Shop(ShopID)
);

CREATE TABLE Dine (
   UID INT,
   OID INT,
   AmountSpent FLOAT,
   DayTimeIn DATETIME,
   DayTimeOut DATETIME,
   PRIMARY KEY (DayTimeIn, UID),
   FOREIGN KEY (UID) REFERENCES User_Account(UID),
   FOREIGN KEY (OID) REFERENCES Restaurant_Outlet(OutletID)
);

CREATE TABLE Mall_Has_DayPackage (
   DID INT,
   MID INT,
   PRIMARY KEY (DID, MID),
   FOREIGN KEY (DID) REFERENCES DayPackage(DID),
   FOREIGN KEY (MID) REFERENCES Mall(MallID)
);

CREATE TABLE Outlet_Has_DayPackage (
   DID INT,
   OID INT,
   PRIMARY KEY (DID, OID),
   FOREIGN KEY (DID) REFERENCES DayPackage(DID),
   FOREIGN KEY (OID) REFERENCES Restaurant_Outlet(OutletID)
);

CREATE TABLE Mall_Recommendation (
   Mall_NID INT,
   ValidPeriod DATE,
   DateIssued DATE,
   Mall_ID INT,
   PurchaseVoucherVID INT,
   PRIMARY KEY (Mall_NID),
   FOREIGN KEY (PurchaseVoucherVID) REFERENCES PurchaseVoucher(VID),
   FOREIGN KEY (Mall_ID) REFERENCES Mall(MallID),
);

CREATE TABLE Outlet_Recommendation (
   Outlet_NID INT,
   ValidPeriod DATE,
   DateIssued DATE,
   OutletID INT,
   DiningVoucherVID INT,
   PRIMARY KEY (Outlet_NID),
   FOREIGN KEY (OutletID) REFERENCES Restaurant_Outlet(OutletID),
   FOREIGN KEY (DiningVoucherVID) REFERENCES DineVoucher(VID),
);
   
CREATE TABLE User_Use_Mall_Rec (
   UID INT,
   Mall_NID INT,
   PRIMARY KEY (UID, Mall_NID),
   FOREIGN KEY (UID) REFERENCES User_Account(UID),
   FOREIGN KEY (Mall_NID) REFERENCES Mall_Recommendation(Mall_NID)
);

CREATE TABLE User_Use_Outlet_Rec (
   UID INT,
   Outlet_NID INT,
   PRIMARY KEY (UID, Outlet_NID),
   FOREIGN KEY (UID) REFERENCES User_Account(UID),
   FOREIGN KEY (Outlet_NID) REFERENCES Outlet_Recommendation(Outlet_NID)
);