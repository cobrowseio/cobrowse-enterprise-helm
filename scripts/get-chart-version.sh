#!/usr/bin/env bash

set -e

grep 'version:' Chart.yaml | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+.*"
