create-local-env:
	pyenv install 3.9
	pyenv virtualenv 3.9 panda-env
	pyenv activate panda-env
activate-local-env:
	pyenv activate panda-env
requirements:
	pip install -r requirements.txt
run-docker-postgres:
	docker image build ./02.SQL/docker/. -t preloaded_db:1.1
	docker run -p 5432:5432 -e POSTGRES_PASSWORD=1234 --name pandawans_db preloaded_db:1.1