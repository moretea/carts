#! /usr/bin/env nix-shell
#! nix-shell -i bash -p maven
mvn  -Dmaven.repo.local=$(mktemp -d -t maven-XXX)  org.nixos.mvn2nix:mvn2nix-maven-plugin:mvn2nix
