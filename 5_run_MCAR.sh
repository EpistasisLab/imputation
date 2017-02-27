!#/bin/bash

DIRECTORY=./data/spikein/
num_procs=16

for i in $DIRECTORY/MCAR_*; do
(
  while read -r -a curr_jobs < <(jobs -p -r) \
      && (( ${#curr_jobs[@]} >= num_procs )); do
        wait -n
  done
  Rscript ImputeTest.R --name $i &
) done
