gcloud auth login


gcloud config set project <PROJECT_ID>


docker build -t my-app:latest


docker tag my-app:latest gcr.io/<PROJECT_ID>/my-app:latest


docker push gcr.io/<PROJECT_ID>/my-app:latest


gcloud container cluster list


gcloud container cluster get-credentials my-cluster --region=<REGION>


kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get pods
kubectl get svc my-app-service


gcloud container cluster delete my-cluster --region=<REGION>
