all: hw4.html

hw4.html: hw4.qmd data/lq.rds data/dennys.rds
	quarto render hw4.qmd

data/lq.rds: parse_lq.R data/lq/*.html
	Rscript parse_lq.R

data/dennys.rds: parse_dennys.R data/dennys/*.html
	Rscript parse_dennys.R

data/lq/*.html: get_lq.R
	Rscript get_lq.R

data/dennys/*.html: get_dennys.R
	Rscript get_dennys.R

clean:
	rm -rf data/
	rm -f hw4.html

.PHONY: all clean

