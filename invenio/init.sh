#!/bin/bash

# run all pending database migrations
# invenio db init create
echo "running all pending database migrations..."
invenio alembic upgrade heads

# set location for file uploads
echo "setting location for file uploads..."
invenio files location create data /opt/invenio/var/instance/data --default

# add admin role
echo "creating admin role with superuser-access..."
invenio roles create admin
invenio access allow superuser-access role admin

# enable custom fields
echo "enabling custom fields for records..."
invenio rdm-records custom-fields init
echo "enabling custom fields for communities..."
invenio communities custom-fields init

# import fixtures
echo "importing fixtures..."
invenio rdm-records fixtures
invenio rdm fixtures

# refresh opensearch indices
echo "refreshing opensearch indices..."
invenio index destroy --force --yes-i-know
invenio index init
invenio rdm-records rebuild-index
invenio communities rebuild-index

# Steps to declare the MQ queues required for statistics, etc.
invenio queues declare

# create demo records
echo "creating demo communities..."
invenio rdm-records demo communities
echo "creating demo records..."
invenio rdm-records demo records

# add user with admin role
# invenio users create $DEFAULT_ADMIN_EMAIL --password $DEFAULT_ADMIN_PASSWORD --active
# invenio roles add $DEFAULT_ADMIN_EMAIL admin
