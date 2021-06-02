NAME = node-docker 

b:
	docker build -t $(NAME) .
rm:
	docker rm -f $(NAME)	
stop:
	docker stop $(NAME)
run:
	docker run -d -p 8000:8000 --name $(NAME) $(NAME)
open:
	docker exec -it -- $(NAME) bash
