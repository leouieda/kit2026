# Baixa os dados de temperatura
import pooch

pooch.retrieve(
	url="https://github.com/compgeolab/temperature-data/releases/download/2025-02-11/temperature-data.zip",
	known_hash="md5:d102212049af1695b686c94ae1eea233",
	path="data",
	fname="temperature-data.zip",
	processor=pooch.Unzip(extract_dir="temperature"),
)
