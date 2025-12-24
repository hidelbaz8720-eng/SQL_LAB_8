USE universite_test;
SHOW TABLES;
SELECT COUNT(*) FROM ETUDIANT;
EXPLAIN
SELECT e.nom, COUNT(i.id)
FROM ETUDIANT e
JOIN INSCRIPTION i ON i.etudiant_id = e.id
GROUP BY e.id;
EXPLAIN
SELECT e.nom, COUNT(i.id)
FROM ETUDIANT e
JOIN INSCRIPTION i ON i.etudiant_id = e.id
GROUP BY e.id;
CREATE INDEX idx_inscription_etudiant
ON INSCRIPTION(etudiant_id);
EXPLAIN
SELECT e.nom, COUNT(i.id)
FROM ETUDIANT e
JOIN INSCRIPTION i ON i.etudiant_id = e.id
GROUP BY e.id;
ANALYZE TABLE INSCRIPTION;
OPTIMIZE TABLE INSCRIPTION;
DROP INDEX idx_inscription_etudiant ON INSCRIPTION;

EXPLAIN
SELECT e.nom, COUNT(i.id)
FROM ETUDIANT e
JOIN INSCRIPTION i ON i.etudiant_id = e.id
GROUP BY e.id;

CREATE INDEX idx_inscription_etudiant
ON INSCRIPTION(etudiant_id);

EXPLAIN
SELECT e.nom, COUNT(i.id)
FROM ETUDIANT e
JOIN INSCRIPTION i ON i.etudiant_id = e.id
GROUP BY e.id;

DROP INDEX idx_inscription_etudiant ON INSCRIPTION;
