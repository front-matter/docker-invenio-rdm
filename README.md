# docker-invenio-rdm

[Compose](https://docs.docker.com/compose/) is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services. Compose is the easiest way to run [InvenioRDM](https://inveniordm.docs.cern.ch/). This makes Docker Compose perfect for development, testing, and staging environments, it is not recommended to use it in production.

The Compose file included here uses existing Docker images for InvenioRDM and its dependencies. It does not build images from source, and it does not have other dependencies besider Docker itself.

## Getting Started

* [Install Docker](https://docs.docker.com/install/)
* Start Compose with `docker compose up -d`
* Access the InvenioRDM application at `https://127.0.0.1`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.