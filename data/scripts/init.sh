#!/bin/bash

# run all pending database migrations
invenio alembic upgrade heads

# import fixtures
invenio rdm-records fixtures

# create demo records
invenio rdm-records demo communities
invenio rdm-records demo records

# refresh opensearch indices
invenio index destroy --force --yes-i-know
invenio index init
