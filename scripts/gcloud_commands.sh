# General Config Commands for CloudShell:
#1. Setup / Auth CloudShell
gcloud auth login

#2. List all projects
gcloud projects list

#3. Set the default project in cloudshell
gcloud config set project your-project-id

#4. Set the default compute region and zone
gcloud config set compute/region your-region
gcloud config set compute/zone your-zone

#5. List all ENABLED services in project
gcloud services list --enabled