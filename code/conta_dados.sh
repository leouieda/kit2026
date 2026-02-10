# Conta numero de dados de cada pais

echo "ndados,pais"
for arquivo in data/temperature/*.csv;
do
	echo $(tail -n +7 $arquivo | wc -l),$(basename -s .csv $arquivo);	
done