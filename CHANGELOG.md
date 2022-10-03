# Changelog

This is the changelog for the heml chart only. For the full enterprise release changelog please see [here](https://github.com/cobrowseio/cobrowse-enterprise-helm/releases/tag/v1.10.0)

## [1.10.0](#) (2022-10-03)


### Features

* add support for dynamic provisioning with default storage class ([9ae1942](#))
* configurable service image repo ([#24](#)) ([37f8957](#))
* make nfs storage class the default ([6454e81](#))
* support aws-efs storage class option and pv ([82d13f3](#))
* support use of local images through image.repo ([#27](#)) ([a78c26f](#))


### Bug Fixes

* **api:** bump image version to 1.25.3 ([55fda23](#))
* **api:** bump image version to 1.25.4 ([cff56fe](#))
* **eks:** disable TLS 1.0 and 1.1 ([885a8d7](#))
* **frontend:** bump image version to 2.24.4 ([1181353](#))
* **frontend:** bump image version to 2.24.5 ([9ce5e61](#))
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

* **images:** update image versions ([1d48a94](#))
* **images:** update image versions ([57c464e](#))
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

* **images:** update image versions ([810fab0](#))
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
