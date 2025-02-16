+++
slug = 'traefik'
tags = ['published']
title = 'Traefik'
+++

## Automatic ACME certificates for Docker containers

**Important options for Traefik command**

````bash
# Options added to traefik command or configuration file
--certificateresolvers.http.acme.httpchallenge.entrypoint=web # Entrypoint for port 80
--certificateresolvers.http.acme.email=example@domain.com # Email for cert authority comms
--certificateresolvers.http.storage=/letsencrypt/acme.json # Challenges and certs are stored here
````

**Labels for containers connecting to Traefik**

````yaml
# Example using nginx listening on port 80
labels:
    - "traefik.http.routers.${PROJECT_NAME}_nginx.rule=Host(`${PROJECT_BASE_URL}`, `${PROJECT_SECONDARY_URL}`)" # No HostSNI, use the traefik.http
    - "traefik.http.routers.${PROJECT_NAME}_nginx.entrypoints=websecure" # The entrypoint should use the secure version
    - "traefik.http.routers.${PROJECT_NAME}_nginx.service=${PROJECT_NAME}_nginx"
    - "traefik.http.services.${PROJECT_NAME}_nginx.loadbalancer.server.port=80" # Uses port 80 on the service side
    - "traefik.http.routers.${PROJECT_NAME}_nginx.tls.certresolver=http" # Certificate resolver specified in the Traefik config
    - "traefik.http.routers.${PROJECT_NAME}_nginx.tls.domains.main=${PROJECT_BASE_URL}" # Main domain
    - "traefik.http.routers.${PROJECT_NAME}_nginx.tls.domains.sans=${PROJECT_SECONDARY_URL}" # Additional domains should be added to the sans variant
````
