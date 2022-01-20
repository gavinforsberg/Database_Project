SELECT e.Fname as First, e.Lname as Last, e.EmpID as ID, e.ProgID, p.Pname, c.Fname as ChildFirst, c.Lname as ChildLast, pg.Fname as ParentFirst, pg.Lname as ParentLast
FROM Employee e, Programs p, Children c, Parents_Guardians pg
WHERE c.ProgID = e.ProgID AND e.ProgID = p.ProgID AND pg.PID = c.PID AND pg.Pssn = '445588789'


SELECT pg.Fname as ParentFirst, pg.Lname as ParentLast, c.Fname as ChildFirst, c.Lname as ChildLast, p.cost 
FROM Programs p, Parents_Guardians pg, Children c 
WHERE c.PID = pg.PID AND c.ProgID = p.ProgID AND p.cost <= 775


SELECT Fname, Lname, Email 
FROM Employee JOIN Programs 
WHERE Employee.ProgID= Programs.ProgID AND Programs.Pname='PreSchool'


SELECT Fname, Lname, Pname, PID 
FROM Children
JOIN Programs
ON Children.ProgID=Programs.ProgID
WHERE age > 3


SELECT Fname, Lname, BillID
FROM Parents_Guardians 
JOIN Bills
ON Parents_Guardians.PID= Bills.PID
WHERE BillAddr = '124 Chase Dr'


SELECT pg.Fname as First, pg.Lname as Last, p.ProgID, pg.PID 
FROM Parents_Guardians pg, Children c, Programs p 
WHERE p.ProgID=pg.PID AND p.Pname='GradeSchool'


SELECT Pname, Fname, Lname, COUNT(EmpID)
FROM Employee
JOIN Programs
ON Employee.ProgID=Programs.ProgID
WHERE Programs.ProgID=3
GROUP BY Pname, Fname, Lname, Programs.ProgID;


SELECT Fname, Lname
FROM Employee
WHERE 
EXISTS( SELECT Fname, Lname
FROM Employee 
WHERE ProgID = 1 OR ProgID = 2 OR ProgID = 3 OR ProgID = 4)
AND
NOT EXISTS( SELECT Fname, Lname
FROM Employee
WHERE ProgID = 2 OR ProgID = 4);


SELECT PID FROM Bills
UNION
SELECT PID FROM Parents_Guardians
ORDER BY PID;


SELECT Pname AS Type,
        Room, Age, Cost
FROM Programs
UNION ALL
SELECT CID AS Type,
        Fname, Lname, Cssn
FROM Children;