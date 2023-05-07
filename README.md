# docker-invenio-rdm

Docker Compose configuration for [InvenioRDM](https://inveniordm.docs.cern.ch/).

[Compose](https://docs.docker.com/compose/) is a part of the Docker application, used for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services. 

Compose is the easiest way to run [InvenioRDM](https://inveniordm.docs.cern.ch/). This makes Docker Compose perfect for development, testing, and staging environments, but it is not recommended to use it in production. (for production deployments, use a container orchestrator such as [Kubernetes](https://kubernetes.io/), [Elastic Container Service](https://aws.amazon.com/ecs/), or [Nomad](https://www.nomadproject.io/).)

The Compose file included here uses existing Docker images for InvenioRDM and its dependencies. It does not build images from source, and it does not have other dependencies besider Docker itself. The initial setup of InvenioRDM should not take more than 15 minutes.

## Getting Started

* [Install Docker](https://docs.docker.com/install/)
* [Clone this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository)
* Start Compose with `docker compose up`
* Access the InvenioRDM application at `https://127.0.0.1` (web frontend) or `https://127.0.0.1/api/records` (REST API).

## Setup

**Database migrations**

InvenioRDM uses [Alembic](https://alembic.sqlalchemy.org/en/latest/) for database migrations. To run pending migrations, use the following command (which will run the migrations in the container):

```bash
docker exec -it docker-invenio-rdm-web-api-1 invenio alembic upgrade heads
```

**Opensearch index**

```bash
docker exec -it docker-invenio-rdm-web-api-1 invenio index destroy --force --yes-i-know
docker exec -it docker-invenio-rdm-web-api-1 invenio index init
docker exec -it docker-invenio-rdm-web-api-1 invenio rdm-records fixtures
docker exec -it docker-invenio-rdm-web-api-1 invenio rdm-records rebuild-index
docker exec -it docker-invenio-rdm-web-api-1 invenio index run
```

## Customization

* Override the default configuration by changing the `docker-compose.override.yml` file.
* More info on [Customizing InvenioRDM](https://inveniordm.docs.cern.ch/customize/)

## Documentation

Detailed InvenioRDM documentation is [here](https://inveniordm.docs.cern.ch/).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.