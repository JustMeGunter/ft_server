NAME = test

build:
	docker build -t $(NAME) .
rm:
	docker rm -f $(NAME)	
	docker rmi -f $(NAME)
stop:
	docker stop $(NAME)
run:
	docker run -p 80:80 --name $(NAME) $(NAME)
open:
	docker exec -it -- $(NAME) bash
