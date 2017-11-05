#!/bin/bash

echo $1

rm -rf target
mkdir target
git bundle create target/docker-java.bundle master
cp target/docker-java.bundle ../ci-runner/repos/