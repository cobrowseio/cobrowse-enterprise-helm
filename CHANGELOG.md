# Changelog

This is the changelog for the helm chart only. For the full enterprise release changelog please see [here](https://github.com/cobrowseio/cobrowse-enterprise-helm/releases)

### [2.2.2](#) (2023-01-25)

### [2.2.1](#) (2023-01-17)

## [2.2.0](#) (2022-12-15)


### Features

* optional volume ([#31](#)) ([c6e55f1](#))


### Bug Fixes

* **api:** bump image version to 1.31.5 ([cbe3f24](#))
* **frontend:** bump image version to 2.30.3 ([4ccca1e](#))
* **proxy:** bump image version to 1.4.2 ([aefa53f](#))
* **recording:** bump image version to 1.9.2 ([8f3b97b](#))
* **sockets:** bump image version to 1.5.0 ([fb0966d](#))
* **sockets:** bump image version to 1.5.2 ([78ad216](#))

### [2.1.1](#) (2022-11-15)


### Bug Fixes

* allow override proxy and recording replicas to 0 ([#30](#)) ([58454b8](#))
* **api:** bump image version to 1.29.1 ([7426b9e](#))
* **frontend:** bump image version to 2.26.2 ([a3dc75c](#))
* **proxy:** bump image version to 1.3.24 ([2afbbc1](#))
* **recording:** bump image version to 1.8.4 ([b786c35](#))
* **sockets:** bump image version to 1.4.1 ([c9daee7](#))

## [2.1.0](#) (2022-10-26)


### Features

* recording can call token validation on api ([#28](#)) ([fd8b657](#))


### Bug Fixes

* **api:** bump image version to 1.27.1 ([aadf3a6](#))
* **frontend:** bump image version to 2.24.9 ([2c374b4](#))
* **sockets:** bump image version to 1.4.0 ([52e0cd0](#))

## [2.0.0](#) (2022-10-05)


### Upgrade instructions

#### 1. If you specify a value for `storage.server`

If you specify an NFS server path using the cobrowse helm chart value `storage.server`, you are using static provisioning with an NFS volume. You should perform the following steps to ensure helm does not attempt to delete your PVC and PV resources upon upgrade:

  1. Detach your PV and PVC from helm management

    ```bash
    $ kubectl annotate pvc cobrowse-sockets-pvc "helm.sh/resource-policy=keep"
    $ kubectl annotate pv cobrowse-sockets-pv "helm.sh/resource-policy=keep"
    ```

  2. Update your helm values to set `storage.class` to the value `null`. For example:

    ```yaml
    storage:
      class: null
    ```

  3. Update your helm values to remove the values `storage.server` and `storage.path`

#### 2. Apply the new helm chart version

Run `helm upgrade`.


### Features

* add support for dynamic provisioning with default storage class ([9ae1942](#))
* configurable service image repo ([#24](#)) ([37f8957](#))
* make nfs storage class the default ([6454e81](#))
* support aws-efs storage class option and pv ([82d13f3](#))
* support use of local images through image.repo ([#27](#)) ([a78c26f](#))


### Bug Fixes

* **api:** bump image version to 1.25.4 ([cff56fe](#))
* **eks:** disable TLS 1.0 and 1.1 ([885a8d7](#))
* **frontend:** bump image version to 2.24.6 ([03fc33b](#))
* helm no longer deploys a PV ([080f9d2](#))
* quotes are not needed for null in helm values ([#23](#)) ([d3d33e6](#))

### [1.9.5](#) (2022-07-18)


### Bug Fixes

* **images:** update image versions ([885d641](#))

### [1.9.4](#) (2022-06-13)


### Bug Fixes

* fix release script ([6cbc344](#))
* **images:** update image versions ([a770d04](#))

### [1.9.3](#) (2022-05-01)


### Bug Fixes

* **images:** update image versions ([8cee9dc](#))

### [1.9.2](#) (2022-04-03)


### Bug Fixes

* **images:** update image versions ([713ed16](#))

### [1.9.1](#) (2022-03-17)


### Bug Fixes

* **images:** update image versions ([35d050b](#))
* use busybox for sockets init container ([d4cd34b](#))

## [1.9.0](#) (2022-03-10)


### Features

* chromium sidecar ([2ec8cea](#))
* give recording servers access to frontend_url ([b43136b](#))
* map /tmp to memory so puppeteer can store profiles there ([e7e6193](#))


### Bug Fixes

* certmanager tls certificate name was out of sync ([caf133a](#))
* increase gke ingress timeout for recording downloads ([2b1cf80](#))

### [1.8.5](#) (2022-02-10)


### Bug Fixes

* **images:** update image versions ([f31c1ae](#))

### [1.8.4](#) (2022-02-02)


### Bug Fixes

* **images:** update image versions ([bbe31a4](#))

### [1.8.3](#) (2022-01-27)


### Bug Fixes

* **images:** update image versions ([091eee3](#))

### [1.8.2](#) (2022-01-27)


### Bug Fixes

* **images:** update image versions ([fd0c60d](#))
* make recordings cache dir naming more consistent ([c208278](#))
* store recording cache on a volume ([a991adb](#))

### [1.8.1](#) (2022-01-11)


### Bug Fixes

* **images:** update image versions ([c9db68c](#))

## [1.8.0](#) (2022-01-04)


### Features

* restrict all containers to read-only root fs ([268846d](#))
* runAs specified user and group ([4fa2052](#))


### Bug Fixes

* **images:** update image versions ([d6e18c0](#))
* remove base64 encoding from superusers configmap entry ([e83ed52](#))

### [1.7.1](#) (2021-12-07)


### Bug Fixes

* **images:** update image versions ([5a24a87](#))

## [1.7.0](#) (2021-12-03)


### Features

* allow docker credentials to be managed externally from helm ([5d48e60](#))


### Bug Fixes

* **images:** update image versions ([767bd5f](#))

## [1.6.0](#) (2021-12-01)


### Features

* add pod label to select cobrowse enterprise services ([d622550](#))
* allow for custom configmaps and secrets managed in kubernetes ([41656ef](#))
* always enable prometheus scraping ([e7ec67b](#))
* always use pathType=Prefix for Ingress ([d7496a2](#))
* configurable service images references ([6bbde11](#))
* name the sockets port ([7b71478](#))


### Bug Fixes

* **images:** update image versions ([315da2f](#))
* fix DEBUG helm value for api ([2fa4969](#))
* guard for unspecified dict parent ([5fc555f](#))
* suffix /* at end of azure ingress prefix path ([556ad6d](#))

### [1.5.12](#) (2021-10-22)


### Bug Fixes

* **images:** update image versions ([e9cdfad](#))

### [1.5.11](#) (2021-10-14)


### Bug Fixes

* **images:** update image versions ([0236f0f](#))

### [1.5.10](#) (2021-10-14)


### Bug Fixes

* **images:** update image versions ([9dcb0d2](#))

### [1.5.9](#) (2021-09-07)


### Bug Fixes

* **images:** update image versions ([531ef3b](#))

### [1.5.8](#) (2021-09-06)


### Bug Fixes

* update deployment strategy to allow 50% surge ([71c6009](#))
* **images:** update image versions ([e273afb](#))

### [1.5.7](#) (2021-06-24)


### Bug Fixes

* **images:** update image versions ([c3e06a5](#))

### [1.5.6](#) (2021-06-16)


### Bug Fixes

* **images:** update image versions ([4d92454](#))
