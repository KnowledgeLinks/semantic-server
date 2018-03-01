# Semantic Server Docker
A project for creating a single Docker image that uses [supervisord](http://supervisord.org/) to
run [Blazegraph][BLAZEGRAPH], [Fedora Commons][FEDORA], and 
[Elasticsearch][ES] for backend use in [BIBCAT](http://bibcat.org/)-based 
projects.


## Quick start
docker run -p 8080:8080 -p 9200:9200 -p 9999:9999 knowledgelinks/semantic-server

## Mount Volumes for Persistence
Using the Semantic Server for anything but trival applications, you'll 
likely want to persist data between Docker restarts.
### Data directory paths
- *Elasticsearch:* /opt/elasticsearch/data
- *Blazegraph:* /opt/triplestore/data
- *Fedora:* /opt/repository/fcrepo4-data

### From the command-line

### Use in docker-compose

## Troubleshooting
**Elasticseach not loading/dying:** Elasticsearch version 6 requires higher than default virtual memory size as described in this [Elastcisearch doc](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html). To increase size on a linux machine enter:

> `sudo sysctl -w vm.max_map_count=262144`
 
[BLAZEGRAPH]: https://www.blazegraph.com/
[ES]: https://www.elastic.co/guide/en/elasticsearch/
[FEDORA]: http://www.fedorarepository.org/

**Volume mapping Elasticsearh:** Possibly need to set permission on the host machine as described here in this [Elasticsearch Doc ](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_notes_for_production_use_and_defaults)

> mkdir esdatadir
> chmod g+rwx esdatadir
> chgrp 1000 esdatadir
