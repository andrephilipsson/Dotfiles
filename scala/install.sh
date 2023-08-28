#!/bin/sh

if test $(which coursier)
then
echo "› coursier setup"

coursier setup
fi
