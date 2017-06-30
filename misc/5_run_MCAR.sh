#!/bin/bash

DIRECTORY=./data/spikeincsv
num_procs=16

for i in $DIRECTORY/MCAR_*; do
(
  while read -r -a curr_jobs < <(jobs -p -r) \
      && (( ${#curr_jobs[@]} >= num_procs )); do
        wait -n
  done
  Rscript ImputeTest.R ${i##*/} &
) done
