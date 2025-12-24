#!/bin/bash

# Variables
USER=root
DB=universite_test
BACKUP_DIR=./backup_lab8

# Création du dossier de backup
mkdir -p $BACKUP_DIR

echo "=== Sauvegarde complète de $DB ==="
mysqldump -u $USER -p \
 --routines --triggers --events \
 --single-transaction \
 $DB > $BACKUP_DIR/universite_full.sql

echo "=== Sauvegarde structure seule ==="
mysqldump -u $USER -p --no-data $DB > $BACKUP_DIR/universite_schema.sql

echo "=== Sauvegarde données seules ==="
mysqldump -u $USER -p --no-create-info $DB > $BACKUP_DIR/universite_data.sql

echo "=== Analyse et optimisation ==="
mysql -u $USER -p $DB <<EOF
ANALYZE TABLE INSCRIPTION;
OPTIMIZE TABLE INSCRIPTION;
EOF

echo "=== Vérification des tables ==="
mysql -u $USER -p $DB -e "SHOW TABLES;"

echo "=== Terminé ==="
