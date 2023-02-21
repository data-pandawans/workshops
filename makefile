create-local-env:
	pyenv install 3.9
	pyenv virtualenv 3.9 panda-env
	pyenv activate panda-env
activate-local-env:
	pyenv activate panda-env
requirements:
	pip install -r requirements.txt
