# Cobrowse

[Cobrowse](https://github.com/cobrowseio/cobrowse-enterprise-helm)
is an out-of-tree cobrowse app for Kubernetes. This chart will deploy the Kubernetes cobrowse application. This includes the following services: api, frontend, recording, proxy, and sockets.

## TL;DR;

```console
$ helm add repo cobrowse https://cobrowseio.github.io/cobrowse-enterprise-helm
$ helm install cobrowse
```

## Introduction

This chart bootstraps a [cobrowse](https://github.com/cobrowseio/cobrowse-enterprise-helm/tree/master)
deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh)
package manager.

## Installing the Chart

To install the chart with the release name `cobrowse`:

```console
$ helm install cobrowse --name cobrowse
```

The command deploys cobrowse on the Kubernetes cluster in the default
configuration. The [configuration](#configuration) section lists the parameters
that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `cobrowse` deployment:

```console
$ helm delete cobrowse
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Configuration

The following table lists the configurable parameters of the kibana chart and
their default values.

| Parameter                      | Description                                                                                                     | Default                                                  |
|:-------------------------------|:----------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------|
| `imageCredentials.registry`    | Registry of the cobrowse docker images                                                                          | `ghcr.io`                                                |
| `imageCredentials.username`    | The username used to access the docker registry                                                                      | `nil`   |
| `imageCredentials.password`    | The password used to access the docker registry                                                                      | `nil`   |
| `imageCredentials.email   `    | The email address used to access the docker registry                                                            | `nil` [Optional]                                                 |
| `stage`                        | -                                                                                               | `nil`                                           |
| `region`                       | -                                                                                                    | `nil`                                              |
| `domain`                       | -                                                    |  `nil`                                             |
| `licenseKey`                   | -                                                |  `nil`                                                |
| `accountCreators`              | -                                                    |  `nil`                                                  |
| `superusers`                   | -    | `nil`                                                    |
| `mongoUrl`                     | Endpoint of the mongoDB database                     | `nil`                                                    |
| `smtpUrl`                      | Endpoint of the smtp server/service    | `nil`                                                    |
| `redisUrl`                     | Endpoint of the redis server/cluster (i.e. redis://[USERNAME]:PASSWORD@HOST:PORT )                                                                            | `false`                                                  |
| `ingress.class`                | Class of the Ingress controller                                                                             | `nil`                                                    |
| `api.port`                     | The port of the API container service                                                                              | `8080`                                          |
| `api.image`                    | The image of the API container service                                                                           | `nil`                                                    |
| `api.replicas`                 | The number of API pods to deploy                                                   | `1`                                                   |
| `api.cpu`                      | The cpu specification (request and limits) of each API pod                         | `256m`              |
| `api.memory`                   | The memory specification (request and limits) of each API pod                                    | `256Mi`                                                  |
| `api.debug`                    | -                                                                     | `nil`                                                    |
| `api.service.type`             | The service type used to expose of the API deployment                              | `ClusterIP`   |
| `frontend.port`                     | The port of the Frontend container service                                                                              | `8080`                                          |
| `frontend.image`                    | The image of the Frontend container service                                                                           | `nil`                                                    |
| `frontend.replicas`                 | The number of Frontend pods to deploy                                                   | `1`                                                   |
| `frontend.cpu`                      | The cpu specification (request and limits) of each Frontend pod                         | `256m`              |
| `frontend.memory`                   | The memory specification (request and limits) of each Frontend pod                                    | `256Mi`                                                  |
| `frontend.debug`                    | -                                                                     | `nil`                                                    |
| `frontend.service.type`             | The service type used to expose of the Frontend deployment                              | `ClusterIP`   |
| `proxy.port`                     | The port of the Proxy container service                                                                              | `8080`                                          |
| `proxy.image`                    | The image of the Proxy container service                                                                           | `nil`                                                    |
| `proxy.replicas`                 | The number of Proxy pods to deploy                                                   | `1`                                                   |
| `proxy.cpu`                      | The cpu specification (request and limits) of each Proxy pod                         | `256m`              |
| `proxy.memory`                   | The memory specification (request and limits) of each Proxy pod                                    | `256Mi`                                                  |
| `proxy.debug`                    | -                                                                     | `nil`                                                    |
| `proxy.service.type`             | The service type used to expose of the Proxy deployment                              | `ClusterIP`   |
| `recording.port`                     | The port of the Recording container service                                                                              | `8080`                                          |
| `recording.image`                    | The image of the Recording container service                                                                           | `nil`                                                    |
| `recording.replicas`                 | The number of Recording pods to deploy                                                   | `1`                                                   |
| `recording.cpu`                      | The cpu specification (request and limits) of each Recording pod                         | `256m`              |
| `recording.memory`                   | The memory specification (request and limits) of each Recording pod                                    | `256Mi`                                                  |
| `recording.debug`                    | -                                                                     | `nil`                                                    |
| `recording.service.type`             | The service type used to expose of the Recording deployment                              | `ClusterIP`   |
| `sockets.port`                     | The port of the Sockets container service                                                                              | `8080`                                          |
| `sockets.image`                    | The image of the Sockets container service                                                                           | `nil`                                                    |
| `sockets.replicas`                 | The number of Sockets pods to deploy                                                   | `1`                                                   |
| `sockets.cpu`                      | The cpu specification (request and limits) of each Sockets pod                         | `256m`              |
| `sockets.memory`                   | The memory specification (request and limits) of each Sockets pod                                    | `256Mi`                                                  |
| `sockets.debug`                    | -                                                                     | `nil`                                                    |
| `sockets.service.type`             | The service type used to expose of the Sockets deployment                              | `ClusterIP`   |
| `sockets.storage.size`             | The storage size to be used for data                              | `100Gi`   |
| `sockets.storage.className`        | The storage size to be used for data                              | `100Gi`   |
| `sockets.mountPath`             | The storage size to be used for data                              | `100Gi`   |


```console
$ helm install cobrowse-chart --name cobrowse \
  --set=stage=enterprise,domain=cobrowse.io
```

Alternatively, a YAML file that specifies the values for the above parameters
can be provided while installing the chart. For example,

```console
$ helm install cobrowse --name cobrowse -f values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml) as an example