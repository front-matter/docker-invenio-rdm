#!/bin/bash

# run all pending database migrations
invenio alembic upgrade heads

# import fixtures
invenio rdm-records fixtures

# create demo records
invenio rdm-records demo communities
invenio rdm-records demo records

# create opensearch indices
invenio index destroy --force --yes-i-know
invenio rdm-records rebuild-index
invenio index run
