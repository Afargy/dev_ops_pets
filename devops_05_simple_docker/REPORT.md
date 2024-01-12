## Part 1. Ready-made docker

1. `docker pull` and `docker images` outputs\
![](images/1.1.png)
1. `docker run -d nginx` output\
![](images/1.2.png)
1. `docker ps`\
![](images/1.3.png)
1. `docker inspect` oputput\
![](images/1.4.png)
1. find size, ip and exposed ports in `docker inspect` output with `grep`\
![](images/1.5.png)
1. stop the container with `docker stop` and check the container was stoped with `docker ps`\
![](images/1.6.png)
1. start the container with the mapped ports with flag `-p`
![](images/1.8.png)
1. check the port 80\
![](images/1.7.png)
1. restart the docker with `docker restart` and check it was restarted with `docker ps`
![](images/1.9.png)

## Part 2.

1. Read the nginx.conf configuration file inside the docker container with the exec command\
![](images/2.1.png)
1. Create a nginx.conf file on a local machine\
![](images/2.2.png)
1. Configure it on the /status path to return the nginx server status page\
![](images/2.3.png)
1. Copy the created nginx.conf file inside the docker image using the docker cp command\
![](images/2.4.png)
1. Restart nginx inside the docker image with exec\
![](images/2.5.png)
1. Check that localhost:80/status returns the nginx server status page\
![](images/2.6.png)
1. Export the container to a container.tar file with the export command\
![](images/2.7.png)
1. Stop the container
![](images/2.9.png)
1. Delete the image with docker rmi [image_id|repository]without removing the container irst\
![](images/2.10.png)
1.  Delete stopped container\
![](images/2.11.png)
1. Import the container back using the importcommand\
![](images/2.15.png)
1. Run the imported container\
![](images/2.16.png)
1. Check that localhost:80/status returns the nginx server status page\
![](images/2.17.png)


## Part 3.

1. index.c file which prints Hello World!\
![](images/3.1.png)
1. nginx.conf file\
![](images/3.2.png)


In order to run this file and to see 'Hello World!':
1. run container `docker run -d -p 81:81 --name my_container`
3. copy index.c and nginx.c conf `docker cp ./index.c my_container:etc/nginx/` `docker cp ./nginx.conf my_container:/etc/nginx/`
4. enter iside into the containet and execute next commands inside it
5. install gcc spawn-fcgi libfcgi-dev in the container `apt update` `apt install gcc spawn-fcgi libfcgi-dev`
6. `docker exec my_container gcc /etc/nginx/index.c -lfcgi`
7. `spawn-fcgi -p 8080 a.out`
8. `docker exec my_container nginx -s reload`
9. `curl localhost:81`
1. out put of `localhost:80`\
![](images/3.3.png)

## Part 4.

run the following:

1. `docker build -t my_name:mytag .`
2. `docker run -dp 80:81 my_name:mytag`
3. `curl localhost:80`
3. `curl localhost/status`

Result in the browser:\
`localhost:80`\
![](images/4.1.png)\
and `localhost/status`\
![](images/4.2.png)\

## Part 5.

run `hz.sh` from part-5 folder \
![](images/5.1.png)

## Part 6.

1. run `docker compose build`\
![](images/6.1.png)
1. run `docker compose up`\
![](images/6.2.png)
1. run `curl localhost:80`\
![](images/6.3.png)
1. check browser \
![](images/6.4.png)

