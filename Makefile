erase:
	docker-compose down --volumes
	docker-compose down --rmi all

up:
	docker-compose up -d


