# Semantic Server Docker
A project for creating a single Docker image that uses [supervisord](http://supervisord.org/) to
run [Blazegraph][BLAZEGRAPH], [Fedora Commons][FEDORA], and 
[Elasticsearch][ES] for backend use in [BIBCAT](http://bibcat.org/)-based 
projects.


## Quick start

## Mount Volumes for Persistence
Using the Semantic Server for anything but trival applications, you'll 
likely want to persist data between Docker restarts.
### Data directory paths
- Elasticsearch: /opt/elasticsearch/data
- Blazegraph: /opt/triplestore/data
- Fedora: /opt/repository/fcrepo4-data

### From the command-line

### Use in docker-compose

 
[BLAZEGRAPH]: https://www.blazegraph.com/
[ES]: https://www.elastic.co/guide/en/elasticsearch/
[FEDORA]: http://www.fedorarepository.org/
