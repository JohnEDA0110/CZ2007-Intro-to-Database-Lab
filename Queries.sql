/*
Query 1: 
Find the most popular day packages where all participants are related to one another as either family members or members of the same club.
*/

SELECT TOP 2
Popdp.DID, DP.Description, Popdp.RelatedUsers, Popdp.TotalUsers
FROM
   (SELECT CountUser.DID, COUNT(DISTINCT CountUser.P1_UID) AS RelatedUsers, AVG(CountUser.TotalUsers) AS TotalUsers
   FROM
       (SELECT DPCount.DID, RU.P1_UID, COUNT(DISTINCT P2_UID) AS RelatedUsers, AVG(DPCOUNT.UserCount) AS TotalUsers
       FROM (
           SELECT SP1.DID, COUNT(DISTINCT SP1.UID) AS UserCount
           FROM Signup_Package SP1
           GROUP BY SP1.DID
       ) AS DPCount
       INNER JOIN
       (
           SELECT SP.DID, SP.UID AS P1_UID, SP2.UID AS P2_UID, R.Type
           FROM Signup_Package SP
           LEFT JOIN Signup_Package SP2 ON
                     SP2.DID = SP.DID AND SP2.UID!=SP.UID
           INNER JOIN Related R ON
                     (SP.UID = R.Person1UID AND SP2.UID=R.Person2UID)
                     OR (SP.UID=R.Person2UID AND SP2.UID=R.Person1UID)
           WHERE R.Type LIKE 'Family %' OR R.Type LIKE 'Club %'
           GROUP BY SP.DID, SP.UID, SP2.UID, R.Type
       ) AS RU
       ON DPCount.DID=RU.DID
       GROUP BY DPCount.DID, RU.P1_UID
       ) AS CountUser
   WHERE CountUser.RelatedUsers +1 = CountUser.TotalUsers
   GROUP BY CountUser.DID
   ) AS Popdp
INNER JOIN DayPackage DP
ON Popdp.DID = DP.DID
WHERE Popdp.RelatedUsers = Popdp.TotalUsers
ORDER BY Popdp.RelatedUsers DESC;



/*
Query 2: 
Find families who frequently shopped and dined together, with or without day packages.
As part of your output, indicate whether these families use day packages or not.
“Frequently” means at least 50% of the time.
*/

/* Get a table of family members first */
WITH FamilyPairs AS (
  SELECT Person1UID AS P1, Person2UID AS P2, Type
  FROM Related
  WHERE Related.Type LIKE 'Family %'
),

/*Get a table of people who dine together and shop together */
UsersTogether AS (
  /* Settle shoppers first */
  SELECT s1.UID AS P1, s2.UID AS P2, 'SHOP' AS Activity
  FROM Shopping AS s1
  /* Join a 2nd shopping table to the first one, where UID1 < UID2, Outlet is the same and the time overlaps */
  JOIN Shopping AS s2 ON s1.UID < s2.UID
      AND s1.SID = s2.SID
      AND s1.DateTimeIn <= s2.DateTimeOut
      AND s1.DateTimeOut >= s2.DateTimeIn
  UNION ALL
  /* Settle restaurants now */
  SELECT d1.UID AS P1, d2.UID AS P2, 'DINE' AS Activity
  FROM Dine AS d1
  JOIN Dine AS d2 ON d1.UID < d2.UID
      AND d1.OID = d2.OID
      AND d1.DayTimeIn <= d2.DayTimeOut
      AND d1.DayTimeOut >= d2.DayTimeIn
),

/* Combine family table and “do stuff together” table */
FamilyTogether AS (
  SELECT f.p1, f.p2, u.Activity
  FROM FamilyPairs AS f
  JOIN UsersTogether AS u ON (f.p1 = u.P1 AND f.p2 = u.P2) OR (f.p2 = u.P1 AND f.p1 = u.P2)
),

/*Calculate total number of times each user has been out individually*/
Individual_total_dine AS (
   SELECT D.UID, COUNT(*) as num
   FROM Dine as D
   GROUP BY D.UID
),

Individual_total_shopping AS (
   SELECT S.UID, COUNT(*) as num
   FROM Shopping as S
   GROUP BY S.UID
),

Individual_total_outing AS (
   SELECT
       CASE
           WHEN D.UID IS NOT NULL THEN D.UID
           ELSE S.UID
       END as UID,
       CASE
           WHEN D.num IS NOT NULL THEN D.num
           ELSE 0
       END +
       CASE
           WHEN S.num IS NOT NULL THEN S.num
           ELSE 0
       END as total_num
   FROM Individual_total_dine AS D
   FULL JOIN Individual_total_shopping AS S ON D.UID = S.UID
),

/* Count the number of times the family pair has been out together */
FamilyTogetherCount AS (
  SELECT p1, p2, COUNT(*)  AS total_times_together
  FROM FamilyTogether
  GROUP BY p1, p2
),

count_time_together AS(
   SELECT p1, p2, total_times_together, ito1.total_num AS num1, ito2.total_num AS num2
   FROM FamilyTogetherCount as ftc
   INNER JOIN Individual_total_outing AS ito1 ON ito1.UID = ftc.p1
   INNER JOIN Individual_total_outing AS ito2 ON ito2.UID = ftc.p2
),

Frequency_percentage AS (
   SELECT p1, p2, (total_times_together)/CAST((num1 + num2 - total_times_together)AS FLOAT) AS Frequency
   FROM count_time_together
),

Frequently_together AS(
   SELECT fp.p1, fp.p2, r.Type, fp.Frequency
   FROM Frequency_percentage AS fp
   INNER JOIN Related AS r ON r.Person1UID = fp.p1 AND r.Person2UID = fp.p2
   WHERE Frequency >= 0.5
),

Has_day_package AS(
SELECT
  ft.p1,
  ft.p2,
  ft.Frequency,
  ft.Type,
  CASE
      WHEN sp.UID IS NOT NULL THEN 'Yes'
      ELSE 'No'
  END AS Day_Package
FROM
  Frequently_together ft
LEFT JOIN
  Signup_Package sp ON (ft.p1 = sp.UID OR ft.p2 = sp.UID)
)
SELECT *
FROM Has_day_package


/*
Query 3:
What are the most popular recommendations from the app regarding malls?
*/

WITH CombinedRecommendations AS (
   SELECT MR.Mall_ID, COUNT(UUMR.UID) AS UserCount
   FROM Mall_Recommendation MR
   JOIN User_Use_Mall_Rec UUMR ON MR.Mall_NID = UUMR.Mall_NID
   GROUP BY MR.Mall_ID
   UNION ALL
   SELECT RO.MallID, COUNT(UUOR.UID) AS UserCount
   FROM Outlet_Recommendation ORR
   JOIN Restaurant_Outlet RO ON ORR.OutletID = RO.OutletID
   JOIN User_Use_Outlet_Rec UUOR ON ORR.Outlet_NID = UUOR.Outlet_NID
   GROUP BY RO.MallID
)
SELECT Mall_ID, SUM(UserCount) AS TotalReccomendations
FROM CombinedRecommendations
GROUP BY Mall_ID
ORDER BY TotalReccomendations DESC;


/*
Query 4:
Compulsive shoppers are those who have visited a certain mall more than 5 times within a certain period of time.
Find the youngest compulsive shoppers and the amount they spent in total during December 2023.
*/

WITH CompulsiveShoppers AS (
   SELECT
       UA.UID,
       UA.Name,
       UA.DOB,
       SUM(S.AmountSpent) + SUM(CASE WHEN D.AmountSpent IS NOT NULL THEN D.AmountSpent ELSE 0 END) AS Total_Spending
   FROM
       User_Account UA
   JOIN
       Shopping S ON UA.UID = S.UID AND S.DateTimeIn BETWEEN '2023-12-01' AND '2023-12-31'
   LEFT JOIN
       Dine D ON UA.UID = D.UID AND D.DayTimeIn BETWEEN '2023-12-01' AND '2023-12-31'
   GROUP BY
       UA.UID, UA.Name, UA.DOB
   HAVING
       COUNT(*) > 5
)
SELECT
   UID,
   Name,
   DOB,
   Total_Spending
FROM
   CompulsiveShoppers
WHERE
   DOB = (SELECT MAX(DOB) FROM CompulsiveShoppers)
ORDER BY
   DOB ASC;
   
   

/*
Query 5:
Find users who have dined in all the restaurants in some malls, but have never dined in any restaurants in some other malls.
*/

SELECT DISTINCT Dine_UID.UID, UA.Name AS UserName
FROM
(
   SELECT D.UID
   FROM Dine D
   INNER JOIN Restaurant_Outlet RO ON D.OID = RO.OutletID
   GROUP BY D.UID, RO.MallID
   HAVING COUNT(DISTINCT D.OID) = (
       SELECT COUNT(*)
       FROM Restaurant_Outlet
       WHERE MallID = RO.MallID
   )
) AS Dine_UID
INNER JOIN
(
   SELECT UA.UID
   FROM User_Account UA
   CROSS JOIN Mall M
   LEFT JOIN Restaurant_Outlet RO ON RO.MallID = M.MallID
   LEFT JOIN Dine D ON D.UID = UA.UID AND D.OID = RO.OutletID
   WHERE RO.MallID IS NOT NULL AND D.UID IS NULL
) AS No_Dine_UID ON Dine_UID.UID = No_Dine_UID.UID
INNER JOIN User_Account UA ON Dine_UID.UID = UA.UID;

/* Commands below are the break down of the commands above for Query 5 */
/* Show which UID has eaten at every restaurant in a mall */
SELECT D.UID, RO.MallID
FROM Dine D
INNER JOIN Restaurant_Outlet RO ON D.OID = RO.OutletID
GROUP BY D.UID, RO.MallID
HAVING COUNT(DISTINCT D.OID) = (
   SELECT COUNT(*)
   FROM Restaurant_Outlet
   WHERE MallID = RO.MallID
);

/* Show which UID has not eaten in any restaurant of a mall */
SELECT UA.UID, M.MallID, M.MallName
FROM User_Account UA
CROSS JOIN Mall M
WHERE NOT EXISTS (
   SELECT 1
   FROM Restaurant_Outlet RO
   LEFT JOIN Dine D ON RO.OutletID = D.OID AND D.UID = UA.UID
   WHERE RO.MallID = M.MallID AND D.UID IS NOT NULL
);

/*
Query 6:
What are the top 3 highest earning malls and restaurants?
*/

SELECT TOP 3
Mall.MallID, Mall.MallName, SUM(Shopping.AmountSpent) + SUM(Dine.AmountSpent) AS Total_Earnings
FROM Mall
inner join Restaurant_Outlet on Mall.MallID=Restaurant_Outlet.MallID
inner join Dine on Restaurant_Outlet.OutletID=Dine.OID
inner join Shop on Mall.MallID=Shop.MallID
inner join Shopping on Shop.ShopID=Shopping.SID
GROUP BY Mall.MallID, Mall.MallName
ORDER BY Total_Earnings DESC;

/* Restaurants Only */
SELECT TOP 3
Restaurant_Outlet.OutletID, Restaurant_Outlet.RestChainID, SUM(Dine.AmountSpent) AS Total_Earnings
FROM Dine
JOIN Restaurant_Outlet ON Dine.OID = Restaurant_Outlet.OutletID
GROUP BY Restaurant_Outlet.OutletID, Restaurant_Outlet.RestChainID
ORDER BY Total_Earnings DESC

/* Shops only */
SELECT TOP 3 Mall.MallID,Mall.MallName,Shop.ShopType,Shop.ShopID,Shopping.AmountSpent
FROM Mall
INNER JOIN Shop on Mall.MallID=Shop.MallID
INNER JOIN Shopping on Shop.ShopID=Shopping.SID
ORDER BY Shopping.AmountSpent DESC



/*
Extra Query. (Query given to us on Final Day).
Find shops that received the most complaints in December 2023.
*/

SELECT  TOP 3
CS.ShopID, COUNT(CS.CID) AS ComplaintCounts
FROM Complaint C INNER JOIN Complaint_on_Shop CS
ON C.CID = CS.CID
WHERE C.Filed_Date_Time BETWEEN '2023-12-01' AND '2023-12-31'
GROUP BY CS.ShopID
ORDER BY COUNT(CS.CID) DESC
