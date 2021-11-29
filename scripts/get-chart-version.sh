#!/usr/bin/env bash -e

grep 'version:' Chart.yaml | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+"
