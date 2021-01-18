# Jenkins 구성 

### Parameterized Trigger 플러그인 설치

### docker-demo 파이프라인 구성
1. 소스코드관리 - https://github.com/joomanba/docker-demo.git

2. Build (Execute shell)
```
docker build -t 351276329499.dkr.ecr.us-east-1.amazonaws.com/myapp:${GIT_COMMIT} .
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 351276329499.dkr.ecr.us-east-1.amazonaws.com/myapp
docker push 351276329499.dkr.ecr.us-east-1.amazonaws.com/myapp:${GIT_COMMIT}
```
3. 빌드후 조치 (Trigger parameterized build on other projects) 
* Projects to build: docker-demo-deploy
* Trigger when build is: stable
* Predefined paramters: *MYAPP_VERSION=${GIT_COMMIT}*


### docker-demo-deploy 파이프라인 구성 
1. String Parameter- *MYAPP_VERSION*
1. 소스코드관리 - https://github.com/joomanba/terraform-course.git

2. Build (Execute shell)
```
cd docker-demo-3/
scripts/configure-remote-state.sh
touch mykey
touch mykey.pub
terraform apply -auto-approve -target aws_ecs_service.myapp-service -var MYAPP_SERVICE_ENABLE="1" -var MYAPP_VERSION=${MYAPP_VERSION}
```
