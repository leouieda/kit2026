#alvo: dependencia1 dependencia2
#	comando que gera o alvo a partir das dependencias

.PHONY: clean all

all: figuras/taxas_variacao.png

data/temperature-data.zip: code/baixa_dados.py
	python code/baixa_dados.py

results/npaises.txt: data/temperature-data.zip code/conta_paises.sh
	mkdir -p results
	bash code/conta_paises.sh > results/npaises.txt

results/variacao_temperatura.csv: data/temperature-data.zip code/variacao_temperatura.py
	mkdir -p results
	python code/variacao_temperatura.py > results/variacao_temperatura.csv

figuras/taxas_variacao.png: code/plota_dados.py results/variacao_temperatura.csv
	mkdir -p figuras
	python code/plota_dados.py

clean:
	rm -r data results figuras
