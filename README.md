# End-to-End DevOps CI/CD Pipeline

## Overview

A containerized Flask application deployed using an automated
CI/CD pipeline.

## Technologies

- Python
- Flask
- Git
- GitHub
- Docker
- Jenkins
- Kubernetes
- Terraform
- AWS
- Prometheus
- Grafana

## Architecture

Developer
   ↓
GitHub
   ↓
Jenkins
   ↓
Automated Tests
   ↓
Docker Build
   ↓
Docker Hub
   ↓
Kubernetes
   ↓
Flask Application

## Features

- Automated testing
- Docker containerization
- CI/CD using Jenkins
- Kubernetes deployment
- Kubernetes health checks
- Infrastructure as Code using Terraform
- Application monitoring
--------------------------------

Resume entry
Once you have actually built it, you can describe it like this:

End-to-End DevOps CI/CD Pipeline

Developed and containerized a Python Flask application using Docker.
Implemented a Jenkins CI/CD pipeline to automate source checkout, testing, Docker image creation, and deployment.
Deployed the application on Kubernetes using Deployments, Services, replicas, resource limits, and health probes.
Used Terraform for Infrastructure as Code and AWS for cloud infrastructure.
Implemented application/container monitoring using Prometheus and Grafana.
Managed source code and configuration using Git and GitHub.
Only put technologies on your resume after you have actually used them.

The best way for you to start
Since you're a beginner, don't start with AWS + Kubernetes + Jenkins all at once.

Build these milestones:


------------------------
PHASE 1
Flask app
   ↓
GitHub

PHASE 2
Flask app
   ↓
Docker
   ↓
Docker Hub

PHASE 3
GitHub
   ↓
Jenkins
   ↓
Tests
   ↓
Docker
   ↓
Docker Hub

PHASE 4
Docker
   ↓
Kubernetes
   ↓
Running application

PHASE 5
Terraform
   ↓
AWS

PHASE 6
Prometheus
   ↓
Grafana
---------------------------------update jenkins file and add dockerhub details like below --------------
stage('Push Docker Image') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'dockerhub',
            usernameVariable: 'DOCKER_USERNAME',
            passwordVariable: 'DOCKER_PASSWORD'
        )]) {
            bat 'echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin'
            bat 'docker push brahmap/devops-flask-project:latest'
        }
    }
}
