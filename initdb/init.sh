#!/bin/bash
set -e

echo "Running test script"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE SCHEMA "$POSTGRES_DB";
    ALTER SCHEMA "$POSTGRES_DB" OWNER TO "$POSTGRES_USER";
    GRANT ALL PRIVILEGES ON SCHEMA "$POSTGRES_DB" TO "$POSTGRES_USER";
EOSQL
