gcloud services enable compute.googleapis.com container.googleapis.com artifactregistry.googleapis.com


gcloud container clusters get-credentials my-gke-cluster --zone us-central1-a


docker build =t gcr.io/your-project-id/my-app:latest .


gcloud auth configure-docker us-central1-docker.pkg.dev
docker tag gcr.io/your-project-id/my-app:latest us-central1-docker.pkg.dev/your-project-id/my-repo/my-app:latest
docker push us-central1-docker.pkg.dev/your-project-id/my-repo/my-app:latest


kubectl apply -f deployment.yaml
kubectl apply -f service.yaml


kubectl get svc my-app-service


terraform init
terraform apply -auto-approve
