# Analysis and modeling of football data set

This directory contains scripts written during a tutorial / coding session
lecture on Matlab. The goal of the lecture was to showcase empirical data
analysis and statistical simulation. The lecture was a part of Numerical
Methods I course (2019 edition). Originally the code was written in GNU
Octave, but in 2020 it was rewritten to be compatible with Matlab.

Note that the modeling ideas strongly overlaps with ideas discussed by prof.
Tony Padilla in
[this Numberphile video](https://www.youtube.com/watch?v=Vv9wpQIGZDw).

**Update 2020-04-08:** These scripts were updated in 2020, as Matlab wasn't
able to deal with code written in Octave as well as with \*.mat file generated
by Octave. The code was updated and mat files were regenerated.

Note that after the update we have decided to include raw data file (originally
downloaded from [engsoccerdata repository on GitHub](https://github.com/jalapic/engsoccerdata)).
As it seems that data format has changed in the upstream repository.

**Update 2022-04-24:** Another update in 2022. Various updates to match new
practices. Also `main.m` scripts are include for clarity.

**Update 2025-01-13:** Previously this code was available in its own
separate GitHub repository. On this day it was merged with this repository.

## How to run

As directory suggests, there are two sets of scripts - data analysis and
statistical modeling scripts. Both directories include `main.m` scripts,
which gather everything inside the directories into a single
easily readable file. Note that you should run `data-analysis/main.m`
first to generate `*.mat` file used by the `model/main.m` script.

## Licensing

The code in this directory was originally available under Unlicense. Even
after the merge, it continues to be available under this license. In other
words, it does not "inherit" the license of the parent directory - all the
code under this directory continues to be available under Unlicense.
