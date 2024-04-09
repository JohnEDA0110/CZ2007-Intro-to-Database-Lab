INSERT INTO User_Account(UID, Gender, DOB, Name) VALUES
(1, 'Female', '2005-10-20', 'Ananya'),
(2, 'Male', '2001-05-02', 'Adam'),
(3, 'Male', '2010-02-14', 'Shu Yang'),
(4, 'Male', '2010-02-14', 'John'),
(5, 'Female', '1995-12-25', 'Jing Huan'),
(6, 'Male', '2006-04-12', 'Martin'),
(7, 'Male', '1990-05-29', 'Isaac'),
(8, 'Female', '2008-10-20', 'Chloe'),
(9, 'Female', '1994-09-09', 'Shannon'),
(10, 'Male', '2001-09-11', 'Lewis'),
(11, 'Female', '1998-03-15', 'Emily'),
(12, 'Male', '1992-11-18', 'Jacob'),
(13, 'Female', '2003-06-28', 'Lily'),
(14, 'Male', '1978-09-05', 'Michael'),
(15, 'Female', '1965-08-09', 'Sophia'),
(16, 'Male', '2000-08-31', 'Ethan'),
(17, 'Female', '1997-07-22', 'Olivia'),
(18, 'Male', '1985-12-03', 'Benjamin'),
(19, 'Female', '2004-04-19', 'Mia'),
(20, 'Female', '2009-11-07', 'Harper'),
(21, 'Male', '1995-11-28', 'Joesph'),
(22, 'Male', '2002-07-14', 'Alexander'),
(23, 'Female', '1993-07-01', 'Phoebe'),
(24, 'Male', '1955-09-11', 'Brendan'),
(25, 'Male', '2001-10-12', 'Louis'),
(26, 'Male', '2002-01-20', 'Brandon'),
(27, 'Male', '1965-03-29', 'Ted'),
(28, 'Female', '1986-09-21', 'Lana'),
(29, 'Male', '1994-06-04', 'Mike'),
(30, 'Male', '1988-04-24', 'Walter'),
(31, 'Female', '1967-05-30', 'Skyler'),
(32, 'Male', '1980-05-01', 'Huell'),
(33, 'Male', '1999-01-03', 'Jessie'),
(34, ‘Male’, ‘2000-01-01’, ‘Jack’),
(35, ‘Female’,’2001-01-01’,’Emily);

INSERT INTO Mall_Mgmt_Company (CompanyID, Company_Address, Mall_Mgt_Name) VALUES
(1, '712 Lower Changi Singapore', 'SpringField'),
(2, '102 Jurong West Singapore', 'Capital Space'),
(3, '112 Funan Singapore', 'Carriabean Holdings'),
(4, '391 Fusionopolis Singapore', 'SPH'),
(5, '420 Boon Lay Singapore', 'J P Management');

INSERT INTO Mall (MallID, M_Address, MallName, NumShops, CompanyID) VALUES
(1, 'Kings road', 'JCub', 1, 1),
(2, 'Queens road', 'Aperia Mall', 1, 2),
(3, 'Prince road', 'Jurong Point Mall', 1, 3),
(4, 'Peasant road', 'Queens Mall', 1, 4),
(5, 'Knights road', 'IMM', 1, 1);

INSERT INTO Complaint (CID, Text, Status, Filed_date_time) VALUES
(1, 'Shop smelly', 'pending', '2021-09-21 19:37'),
(2, 'Horrible customer service, rude service staff', 'being handled', '2021-05-15 12:21'),
(3, 'too expensive', 'addressed', '2020-06-26 23:21'),
(4, 'Staff touched my food with their hands', 'being handled', '2019-08-01 13:51'),
(5, 'Found a rat in my soup', 'pending', '2021-06-01 15:12'),
(6, 'Staff pepper sprayed me', 'addressed', '2021-12-24 04:21'),
(7, 'restaurant was very smelly', 'being handled', '2020-07-15 17:55'),
(8, 'Poor quality items sold, not as advertised.', 'addressed', '2021-03-14 09:55'),
(9, 'Unhygenic conditions inside the restaurant', 'addressed', '2020-04-01 11:22'),
(10, 'Long wait time for assistance at checkout.', 'pending', '2019-07-06 20:58');

INSERT INTO Shop (ShopID, ShopType, MallID) VALUES
(1, 'Boutique', 1),
(2, 'Electronics', 1),
(3, 'Stationery', 2),
(4, 'Grocery', 2),
(5, 'Hardware', 3),
(6, 'Grocery', 3),
(7, 'Sports Equipments', 4),
(8, 'Electronics', 4),
(9, 'Hardware', 5),
(10, 'Sports Equipments', 5);

INSERT INTO Complaint_on_Shop (CID, ShopID) VALUES
(1, 4),
(2, 4),
(3, 4),
(6, 5),
(8, 5),
(10, 5);

INSERT INTO Restaurant_Chain (RestChainID, RestChainName, RestAddress) VALUES
(1, 'Bcdonald', '123 Orchard Road, Singapore'),
(2, 'Bake Back', '456 Marina Bay Sands, Singapore'),
(3, 'Burger Bing', '789 Sentosa Island, Singapore'),
(4, 'BFC', '321 Clarke Quay, Singapore'),
(5, 'Bollibee', '567 Raffles Place, Singapore'),
(6, 'Barls Jr', '890 Chinatown, Singapore'),
(7, 'Bopeyes', '234 Bugis Street, Singapore'),
(8, 'Basta express', '901 Little India, Singapore'),
(9, 'Bominos', '345 East Coast Road, Singapore'),
(10, 'Bive Buys', '678 Jurong East, Singapore');

INSERT INTO Restaurant_Outlet (OutletID, RestChainID, MallID) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 6, 3),
(7, 7, 4),
(8, 8, 4),
(9, 9, 5),
(10, 10, 5);

INSERT INTO Complaint_on_Restaurant (CID, OutletID) VALUES
(4, 2),
(5, 6),
(7, 9),
(9, 3);

INSERT INTO DayPackage (DID, Description) VALUES
(1, 'Trip to Bugis Junction'),
(2, 'Trip to Jurong Point Mall'),
(3, 'Trip to Jcube'),
(4, 'Trip to West Gate'),
(5, 'Trip to Northpoint'),
(6, 'Trip to The QueensMall'),
(7, 'Trip to Pioneer Mall'),
(8, 'Trip to VivoCity'),
(9, ‘Trip to IMM’),
(10, ‘Trip to JEWEL’);

INSERT INTO Signup_Package (UID, DID) VALUES
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(18, 8),
(19, 8),
(20, 8),
(6, 4),
(7, 4),
(8, 4),
(26, 1);

INSERT INTO Related (Person1UID, Person2UID, Type) VALUES
(1, 2, 'Family 4'),
(1, 4, 'Family 4'),
(2, 4, 'Family 4'),
(3, 1, 'Family 4'),
(3, 2, 'Family 4'),
(3, 4, 'Family 4'),
(5, 1, 'Family 4'),
(5, 2, 'Family 4'),
(5, 3, 'Family 4'),
(5, 4, 'Family 4'),
(6, 7, 'Family 6'),
(6, 8, 'Club 2'),
(7, 8, 'Club 2'),
(10, 11, 'Club 3'),
(10, 12, 'Club 3'),
(10, 13, 'Club 3'),
(11, 12, 'Club 3'),
(11, 13, 'Club 3'),
(13, 12, 'Club 3'),
(15, 16, 'Friend'),
(16, 17, 'Friend'),
(18, 19, 'Family 5'),
(19, 20, 'Family 5'),
(21, 22, 'Friend'),
(23, 25, 'Friend'),
(26, 27, 'Family 1'),
(26, 28, 'Family 1'),
(26, 29, 'Family 1'),
(30, 31, 'Family 2'),
(32, 33, 'Family 3'),
(32, 34, 'Family 3');

INSERT INTO Voucher (VID, Descriptions, Date_Issued, Expired_Date, V_Status) VALUES
(1, '20% off Set A', '2021-03-14', '2021-03-21', 'allocated'),
(2, '1 for 1 All drinks', '2020-02-02', '2020-02-29', 'redeemed'),
(3, 'Buy 2 get 1 free set', '2019-02-14', '2019-02-15', 'expired'),
(4, '10% off drinks', '2021-11-11', '2021-11-18', 'expired'),
(5, '25% off selected items', '2020-10-13', '2020-10-18', 'expired'),
(6, '40% off everything', '2021-03-01', '2021-04-01', 'redeemed'),
(7, '25% off 2nd item', '2021-06-10', '2021-06-15', 'allocated'),
(8, 'Get a free hamper with every set purchased', '2020-07-08', '2020-07-18', 'allocated'),
(9, '30% off Birthday Month', '2020-05-14', '2020-06-14', 'redeemed'),
(10, 'Present this voucher for free welcome gift', '2021-04-13', '2021-04-21', 'expired'),
(11, 'Package 1 10% dining discount', '2022-02-05', '2022-02-12', 'allocated'),
(12, 'Package 2 25% dining discount', '2020-09-12', '2020-09-19', 'redeemed'),
(13, 'Package 3 20% dining discount', '2019-06-07', '2019-06-14', 'expired'),
(14, 'Package 4 15% dining discount', '2015-08-20', '2015-08-27', 'allocated'),
(15, 'Package 5 30% dining discount', '2020-09-12', '2020-10-12', 'redeemed'),
(16, 'Buy 1 get 1 Free!', '2023-04-03', '2023-04-03', 'redeemed'),
(17, '30% off your drink!', '2023-05-03', '2023-06-03', 'redeemed'),
(18, 'Buy 2 get 1 free', '2020-08-12', '2020-09-12', 'redeemed'),
(19, '1 for 1 Sale', '2021-08-12', '2021-09-12', 'allocated'),
(20, '30% off Birthday Month', '2021-08-13', '2021-09-13', 'redeemed'),
(21, '20% off birthday month', '2021-08-14', '2021-09-14', 'allocated');

INSERT INTO GroupVoucher (VID, GroupSize, GroupDiscount, DateTimeUsed, UID) VALUES
(3, 5, 0.4, NULL, 15),
(4, 6, 0.5, NULL, 16),
(9, 4, 0.3, '2024-10-01 21:00', 18);

INSERT INTO PackageVoucher (VID, PackageDiscount) VALUES
(11, 0.1),
(12, 0.25),
(13, 0.2),
(14, 0.15),
(16, 0.5);

INSERT INTO DineVoucher (VID, CashDiscount, DateTimeUsed, UID) VALUES
(1, 15, '2021-03-14 12:47', 10),
(2, 10, '2021-11-16 17:50', 4),
(3, 5, '2019-02-14 16:21', 8),
(4, 25, '2021-11-18 15:03', 3),
(9, 2, '2020-05-14 17:33', 7),
(17, 3, '2023-05-03 12:33', 26);

INSERT INTO PurchaseVoucher (VID, PurchaseDiscount, DateTimeUsed, UID) VALUES
(5, 10, '2024-03-01 08:00', 21),
(6, 15, '2024-03-20 12:30', 22),
(7, 5, '2024-01-17 16:00', 23),
(8, 20, '2024-03-29 20:35', 24),
(10, 25, '2024-04-03 13:25', 25),
(18, 10, '2024-04-04 12:25', 14),
(19, 12, '2024-04-05 14:25', 15),
(20, 5, '2024-04-06 16:25', 16),
(21, 10, '2024-04-07 20:25', 17);

INSERT INTO Shopping (SID, UID, AmountSpent, DateTimeIn, DateTimeOut) VALUES
(1, 1, 500, '2023-12-14 12:15', '2023-10-14 12:20'),
(2, 2, 200, '2023-12-12 13:10', '2023-11-12 13:40'),
(3, 5, 255, '2023-12-11 13:05', '2023-12-11 13:07'),
(4, 6, 120, '2023-11-14 10:15', '2023-12-14 11:16'),
(5, 3, 63, '2023-12-15 17:03', '2023-12-15 17:23'),
(5, 3, 45, '2023-12-16 17:00', '2023-12-16 18:23'),
(5, 3, 79, '2023-12-17 12:03', '2023-12-17 13:15'),
(6, 3, 100, '2023-12-18 20:03', '2023-12-18 20:58'),
(6, 3, 123, '2023-12-19 17:50', '2023-12-19 19:58'),
(6, 3, 321, '2023-12-20 14:03', '2023-12-20 14:58'),
(7, 4, 45, '2023-12-21 11:03', '2023-12-21 12:37'),
(7, 4, 65, '2023-12-22 17:45', '2023-12-22 18:37'),
(7, 4, 99, '2023-12-23 16:33', '2023-12-23 17:37'),
(7, 4, 20, '2023-12-24 17:13', '2023-12-24 17:27'),
(8, 4, 22, '2023-12-25 15:43', '2023-12-25 16:58'),
(8, 4, 32, '2023-12-26 12:43', '2023-12-26 13:18'),
(8, 4, 34, '2023-12-27 19:00', '2023-12-12 19:38'),
(9, 5, 366, '2023-12-01 12:00', '2023-12-01 12:10'),
(9, 5, 300, '2023-12-02 13:00', '2023-12-02 13:10'),
(9, 5, 226, '2023-12-03 14:00', '2023-12-03 14:10'),
(9, 5, 36, '2023-12-04 15:00', '2023-12-04 15:10'),
(10, 5, 100, '2023-12-05 16:00', '2023-12-04 16:10'),
(10, 5, 77, '2023-12-05 17:00', '2023-12-05 17:10'),
(10, 5, 188, '2023-08-06 18:00', '2023-08-06 18:10'),
(1, 6, 234, '2023-08-07 18:01', '2023-08-07 19:11'),
(2, 7, 500, '2023-08-08 18:02', '2023-08-08 20:10'),
(3, 8, 55, '2023-08-09 18:03', '2023-08-09 21:10'),
(4, 9, 67, '2023-08-10 18:04', '2023-08-10 19:14'),
(5, 10, 345, '2023-08-11 18:05', '2023-08-11 18:15'),
(1, 30, 123, '2023-06-01 15:25', '2023-06-01 17:30'),
(1, 31, 321, '2023-06-01 15:27', '2023-06-01 17:35'),
(4, 26, 12, '2023-04-03 19:25', '2023-04-03 20:31'),
(4, 27, 31, '2023-04-03 19:22', '2023-04-03 20:39'),
(9, 29, 31, '2023-07-10 11:23', '2023-07-10 11:41'),
(9, 29, 42, '2023-07-15 15:21', '2023-07-15 16:00'),
(10, 29, 87, '2023-07-28 09:50', '2023-07-28 11:11'),
(3, 29, 131, '2023-08-01 11:53', '2023-08-01 13:51'),
(3, 30, 391, '2023-08-01 11:55', '2023-08-01 13:40'),
(4, 32, 41, '2023-02-27 12:12', '2023-02-27 13:44'),
(4, 33, 13, '2023-02-27 12:30', '2023-02-27 13:45');

INSERT INTO Dine (UID, OID, AmountSpent, DayTimeIn, DayTimeOut) VALUES
(1, 1, 100, '2024-03-14 12:00', '2024-03-14 12:20'),
(1, 2, 90, '2024-03-12 13:10', '2024-03-12 13:40'),
(1, 3, 75, '2024-03-11 13:05', '2024-03-11 13:07'),
(2, 5, 2, '2024-03-14 10:15', '2024-03-14 11:16'),
(2, 6, 24, '2024-03-15 17:03', '2024-03-15 17:23'),
(2, 7, 86, '2024-03-15 14:30', '2024-03-15 14:58'),
(2, 8, 31, '2024-03-12 17:23', '2024-03-12 17:37'),
(3, 9, 22, '2024-03-12 16:40', '2024-03-12 17:18'),
(4, 10, 5, '2024-03-12 13:23', '2024-03-12 14:00'),
(5, 1, 230, '2024-04-13 14:23', '2024-04-13 15:00'),
(6, 5, 211, '2024-05-14 16:23', '2024-05-14 17:33'),
(30, 10, 43, '2023-06-01 11:10', '2023-06-01 12:30'),
(31, 10, 23, '2023-06-01 11:26', '2023-06-01 12:35'),
(26, 4, 16, '2023-05-03 19:25', '2023-05-03 20:31'),
(27, 4, 10, '2023-05-03 19:22', '2023-05-03 20:39'),
(34, 1, 23, '2023-05-04 20:22', '2023-05-04 22:39'),
(34, 2, 50, '2023-05-05 18:22', '2023-05-05 19:39'),
(35, 3, 34, '2023-05-06 15:22', '2023-05-06 16:39'),
(35, 4, 35, '2023-05-07 12:22', '2023-05-07 13:39');

INSERT INTO Mall_Has_DayPackage (MID, DID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);

INSERT INTO Outlet_Has_DayPackage (DID, OID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO Mall_Recommendation (Mall_NID, ValidPeriod, DateIssued, Mall_ID, PurchaseVoucherVID) VALUES
(1, '2024-03-04', '2024-02-25 12:00', 1, 5),
(2, '2024-02-22', '2024-01-15 11:30', 1, 6),
(3, '2024-03-06', '2024-02-20 08:00', 1, 7),
(4, '2024-03-10', '2024-01-25 12:00', 1, 8),
(5, '2021-11-17', '2021-11-07 14:30', 1, 10),
(6, '2021-11-18', '2021-11-08 12:00', 4, 18),
(7, '2021-11-19', '2021-11-09 12:30', 4, 19),
(8, '2021-09-22', '2021-09-10 15:30', 2, 20),
(9, '2021-11-15', '2021-11-10 16:30', 3, 21);

INSERT INTO Outlet_Recommendation (Outlet_NID, DiningVoucherVID, OutletID, ValidPeriod, DateIssued) VALUES
(1, 1, 1, '2024-03-04', '2024-02-25 12:00'),
(2, 2, 2, '2024-02-22', '2024-01-15 11:30'),
(3, 3, 1, '2024-03-06', '2024-02-20 08:00'),
(4, 4, 2, '2024-03-10', '2024-01-25 12:00'),
(5, 9, 7, '2021-11-17', '2021-11-07 14:30');

INSERT INTO User_Use_Mall_Rec (UID, Mall_NID) VALUES
(14, 6),
(15, 7),
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5),
(16, 8),
(17, 9);

INSERT INTO User_Use_Outlet_Rec (UID, Outlet_NID) VALUES
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(14, 5);

