#!/bin/bash

for example in *example; do
	for pkg in "test" router forms; do
		fd . $example -t f -x sed -i "s/angular_${pkg}/ng${pkg}/g" {}
	done
done
