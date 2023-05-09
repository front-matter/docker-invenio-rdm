#!/bin/bash

# run all pending database migrations
# invenio db init create
invenio alembic upgrade heads

# set location for file uploads
invenio files location create data /opt/invenio/var/instance/data --default

# enable custom fields
invenio rdm-records custom-fields init
invenio communities custom-fields init

# import fixtures
invenio rdm-records fixtures
invenio rdm fixtures

# refresh opensearch indices
invenio index destroy --force --yes-i-know
invenio index init
invenio rdm-records rebuild-index
invenio communities rebuild-index

# Steps to declare the MQ queues required for statistics, etc.
invenio queues declare

# create demo records
invenio rdm-records demo communities
invenio rdm-records demo records

# add user with admin role
invenio roles create admin
invenio access allow superuser-access role admin
# invenio users create <email> --active
# invenio roles add <email> admin
