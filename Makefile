#alvo: dependencia1 dependencia2
#	comando que gera o alvo a partir das dependencias

.PHONY: clean all show

all: paper/paper.pdf

show: paper/paper.pdf
	start paper/paper.pdf

paper/paper.pdf: paper/paper.tex figuras/taxas_variacao.png paper/variaveis/npaises.tex
	tectonic -X compile paper/paper.tex

data/temperature-data.zip: code/baixa_dados.py
	python code/baixa_dados.py

paper/variaveis/npaises.tex: data/temperature-data.zip code/conta_paises.sh
	mkdir -p paper/variaveis
	echo "\newcommand{\NPaises}{`bash code/conta_paises.sh`}" > paper/variaveis/npaises.tex

results/variacao_temperatura.csv: data/temperature-data.zip code/variacao_temperatura.py
	mkdir -p results
	python code/variacao_temperatura.py > results/variacao_temperatura.csv

figuras/taxas_variacao.png: code/plota_dados.py results/variacao_temperatura.csv
	mkdir -p figuras
	python code/plota_dados.py

clean:
	rm -r data results figuras paper/paper.pdf paper/variaveis
