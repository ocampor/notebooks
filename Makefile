clean-notebooks:
	echo "Cleaning notebooks"
	find ./ -name "*.ipynb" | xargs python3 -m nbconvert --ClearOutputPreprocessor.enabled=True --inplace
	echo "Removing checkpoints"
	find . -type d -iname .ipynb_checkpoints -exec rm -r {} +