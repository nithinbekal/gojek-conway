
# Conway's Game of Life

Implement Conway's Game of Life as a command line solution in Ruby.

This code was written for the GO-JEK Game Of Life Challenge
during Rubyconf India 2016.

## Usage

There is a `bin/conway` executable that takes a file containing a grid and
prints out the next state. An optional second argument controls the number of
iterations (50, by default).

```
$ cat seed.txt
0000
0111
0110
0000

$ bin/conway seed.txt 1
0010
0101
0101
0000
```
