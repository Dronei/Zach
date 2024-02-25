-- Aufgabe 1
-- Geben Sie Name (ENAME), Kürzel, Gehalt (SAL) und Einstellungsdatum (HIREDATE) aller Mitarbeiter aus. Das Kürzel besteht aus den ersten drei Buchstaben des Namens.
-- Zeigen Sie nur Mitarbeiterter an, deren Beruf (JOB) nicht "SALESMAN" oder "CLERK" ist.
-- Sortieren Sie das Ergebnis absteigend nach Gehalt und bei gleichem Gehalt absteigend nach Namen.
SELECT 
    ENAME AS "Name", 
    SUBSTR(ENAME,1,3) AS "Kurz",
    CONCAT(TO_CHAR(sal, '9999D99'), ' EUR') AS "Gehalt",
    TO_CHAR(hiredate, 'YYYY/MM/DD') AS "EinstellDat"
FROM 
    EMP
WHERE 
    JOB NOT IN ('SALESMAN', 'CLERK')
ORDER BY 
	sal DESC, ename DESC;

-- Aufgabe 2
-- Die Abteilung 10 möchte für ihre Mitarbeiter und die Berufsbezeichnungen Abkürzungen erstellen. Die Kürzel der Namen bestehen aus dem ersten und letzten Buchstaben. (z.B. "KING" --> "KG") Die Berufsgruppen aus den ersten drei Buchstaben ("PRESIDENT" --> "PRE")
-- Verwenden Sie in der Spalte "ENAME_KURZ" kein "||" zum Verbinden der Texte.
SELECT 
    CONCAT(SUBSTR(ename, 1, 1), SUBSTR(ename, -1, 1)) AS "ENAME_KURZ",
	SUBSTR(job, 1, 3) AS "JOB_KURZ"
FROM
	emp
WHERE
	deptno = 10;

-- Aufgabe 3
-- Runden Sie die Gehälter der Abteilung 30 auf den vollen Hunderter und zeigen Sie die 
-- Differenz von Gehalt und dem gerundeten Gehalt an.
SELECT
	sal,
	ROUND(sal, -2) AS "RSAL",
	ROUND(sal, -2) - sal AS "DIFF"
FROM
	emp
WHERE
	deptno = 30;

-- Aufgabe 4
-- Zeigen Sie alle Mitarbeiter an, die an einem Wochenende (Samstag oder Sonntag) eingestellt wurden.
-- Vorsicht: Achten Sie beim Feld "Wochentag" auf die Leerzeichen am Ende des Textes!
SELECT
	ename,
	hiredate,
	INITCAP(TO_CHAR(hiredate, 'DAY')) AS "Wochentag"
FROM 
	emp
WHERE
    TO_CHAR(hiredate, 'D') IN (1, 7);

-- Aufgabe 5
-- Zeigen Sie alle Mitarbeiter an, die in der zweiten Jahreshälfte eingestellt wurden.
-- Sortieren Sie das Ergebnis absteigend nach Montag und Tag vom Einstellungsdatum. Bei gleichem Werten zusätzlich absteigend nach Namen.
SELECT
	ename,
	hiredate
FROM
	emp
WHERE 
    TO_CHAR(hiredate, 'MM') > 6
ORDER BY 
    TO_CHAR(hiredate, 'DDD') DESC,
	TO_CHAR(hiredate, 'D') DESC,
	ename DESC;

-- Aufgabe 6
-- Zeigen Sie alle Mitarbeiter an, die an einem geraden Tag eingestellt wurden.
-- Sortieren Sie das Ergebnis aufsteigend nach Tag.
SELECT 
    ename, 
    hiredate
FROM 
    emp
WHERE 
    MOD(TO_CHAR(hiredate, 'DD'), 2) = 0
ORDER BY
    TO_CHAR(hiredate, 'DD') ASC;

-- Aufgabe 7
-- Geben Sie den aktuellen Monat und alle Mitarbeiter, die in diesen Montag eingestellt wurden aus.
-- (Tipp: Das Ergebnis ist vom aktuellen Monat abhängig!)
SELECT
	TO_CHAR(SYSDATE, 'MON') AS "Current Month",
	ename,
	hiredate
FROM
	emp
WHERE
	TO_CHAR(SYSDATE, 'MON') = TO_CHAR(hiredate, 'MON');