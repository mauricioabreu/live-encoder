run:
	docker-compose up

test:
	docker-compose run web rspec

.PHONY: test