1) Install:
	a) gcloud ( search Google Cloud SDK )
	b) kubectl: 
		gcloud components install kubectl
	c) docker

2) create cluster on GKE...( search google ) or login after create cluster: 
	gcloud auth login

3) Kubectl: copy command-line access local to remote cluster:
	gcloud container clusters get-credentials standard-cluster-1 --zone us-central1-a --project ancient-vortex-243611

4) Push image to container registry:(gcr.io or dockerhub...)
	a) Build the container image from project: (git clone https://github.com/nodesource/simple-nodejs-k8s)
		docker build -t gcr.io/${PROJECT_ID}/hello-app:v1 .
	b) Upload the container image:
		gcloud auth configure-docker
		docker push gcr.io/${PROJECT_ID}/hello-app:v1

5) To create or update our Deployment and Service:
	kubectl apply -f sample-app.deployment-service.yml
	a) INSPECT AND MANAGE YOUR CLUSTER: 
		kubectl cluster-info
	b) INSPECT YOUR RESOURCES:
		kubectl get all
		kubectl get service : EXTERNAL-IP : opening the external IP address in a browser.
	c) RUN AND INTERACT WITH YOUR NODE.JS APPLICATION:
		kubectl get pods
		kubectl exec -it [POD_NAME] -- /bin/bash
		node
		process.env.TEST_ME
		exit

6) auto CI/CD :
	create 'Cloud Build' (config Dockerfile/cloudbuild.yaml ...) 
	if success then store in 'Container Registry' or github.
	'Cloud Run' deploy to k8s???
	'Cloud Code'?
	
	a) if use Dockerfile, then build succes, copy image name new to deploy.yml and run 'kubectl apply -f .yml'
	b) if use cloudbuil.yml , must trigger github/bibuket... steps: build + push image + set images in deployment.
	c) if use skaffold:(change code -> build local(skaffold build/run/dev) or remote(GCB config skaffold) -> push Repository-> deploy local(minikube) / GKE)
		*) just: ctrl + shift + p -> deploy... / skaffold run -p gcb, will trigger build local/ cloud build to build + push image + deploy to minikube/GKE...
		*) config to trigger code change(GCB) ???
		*) use 'Cloud Code', > Deploy, ...

	
	