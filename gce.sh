#!/bin/sh

(
    set -a # auto-export variables
    . ./gce.env # source environment
    vagrant $@ # execute vagrant w/ args
)
