#Demo: Create a Container using Docker
#Requirements
#1. Install docker
#2. Install dotnet core sdk

#cd to folder container web app folder, if not already there
cd ./webappParentfolder


#This is sample hello world web app
ls -l ./webapp


#Step 1 - Build our first web app and test it prior to putting it in a container
dotnet build ./webapp
dotnet run --project ./webapp #Open a new terminal to test
curl http://localhost:5000 #Access our web application via application URL (cURL = client URL)


#Step 2 - Publish a local build --- this is what will be copied into the container.
#output assets to publish file: -o publish 
dotnet publish -c Release ./webapp 


#Step 3 - Time to build the container and tag it --- the build is defined in the Dockerfile
#See console output: use --progress plain for docker build command
#Delete image: docker rmi webappimage:v1
#Clear cache: docker builder prune && docker image prune --force
docker build -t webappimage:v1 .

#Step 4: Run the container locally and test it out
#--publish: specifies port container listens on (8080), then (:80) specifies port app is listening on inside container
#--detach: give us console back when we launch container
docker run --name webapp --publish 8080:80 --detach webappimage:v1
curl http://localhost:8080


#Delete running webpapp container
docker stop webapp
docker rm webapp

#Image is still available
docker image ls webappimage:v1

#Get docker info
docker ps
