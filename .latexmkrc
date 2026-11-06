$pdf_mode = 5;
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$bibtex = 'bibtex %O %B';
$clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz aux log out toc lof lot fls fdb_latexmk bbl blg';
