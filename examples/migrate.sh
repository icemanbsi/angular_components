#!/bin/bash

for example in *example; do
	for pkg in "test" router forms; do
		fd . $example -t f -x sed -i "s/angular_${pkg}/ng${pkg}/g" {}
		fd . $example -t f -x sed -i "s|package:angular/|package:ngdart/|g" {}
		fd . $example -t f -e yaml -x sed -i "s|angular:|ngdart:|" {}
		fd build.yaml $example -t f -x sed -i "s/angular\|/ngdart\|/" {}
	done
done
