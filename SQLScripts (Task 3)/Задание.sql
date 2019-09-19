--Вывести список сетевых районов, отсортированный по количеству объектов теплопотребления в них.
SELECT na.Name, COUNT(ho.id) as cntHO 
FROM NetworkArea na 
	FULL JOIN Building b ON b.idNetworkArea = na.id 
	FULL JOIN HeatObject ho ON ho.idBuilding = b.id
GROUP BY na.id, na.Name
ORDER BY cntHO

--Вывести топ N объектов теплопотребления с наибольшим количеством участков сети.
SELECT TOP 2 ho.Name, Count(os.idObject) AS cntSec
FROM HeatObject ho
	JOIN ObjectSection os ON os.idObject = ho.id
GROUP BY ho.id, ho.Name
ORDER BY cntSec DESC

--Вывести потребителей (контрагентов), у объектов которых больше всего внутренних участков сети.
SELECT c.Name, Count(os.idObject) AS cntSec
FROM HeatObject ho
	JOIN ObjectSection os ON os.idObject = ho.id
	JOIN Consumer c ON c.PersonalAccount = ho.idConsumer
WHERE os.idType = 2
GROUP BY c.PersonalAccount, c.Name
ORDER BY cntSec DESC

--Вывести рейтинг типов изоляций участков сети по сетевым районам.
--Комментарий: "по сетевым районам" было понято как "по количеству сетевых районов"
SELECT l.Name, COUNT(na.Name) AS cnt
FROM NetworkArea na
	JOIN Building b ON b.idNetworkArea = na.id 
	JOIN HeatObject ho ON ho.idBuilding = b.id
	JOIN ObjectSection os ON os.idObject = ho.id
	JOIN NetworkSection ns ON ns.Num = os.idSection
	JOIN Layer l ON l.id = ns.idLayer
GROUP BY l.Name
ORDER BY cnt DESC

--Вывести информацию о 5 зданиях, в которых больше всего объектов теплопотребления с наружными участками сети.
SELECT TOP 5 b.Address, Count(os.idObject) AS cntSec
FROM HeatObject ho
	JOIN ObjectSection os ON os.idObject = ho.id
	JOIN Building b ON b.id = ho.idBuilding
WHERE os.idType = 1
GROUP BY b.id, b.Address
ORDER BY cntSec DESC
