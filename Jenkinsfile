pipeline {

    agent any

    environment {
        IMAGE_NAME = "yourusername/devops-flask-app"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage("Checkout") {
            steps {
                checkout scm
            }
        }

        stage("Test") {
            steps {
                sh """
                    python3 -m venv venv
                    ./venv/bin/pip install -r app/requirements.txt
                    ./venv/bin/pytest app/test_app.py
                """
            }
        }

        stage("Build Docker Image") {
            steps {
                sh """
                    docker build \
                    -t ${IMAGE_NAME}:${IMAGE_TAG} .
                """
            }
        }

        stage("Push Docker Image") {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {

                    sh """
                        echo \$DOCKER_PASSWORD | docker login \
                        -u \$DOCKER_USERNAME \
                        --password-stdin

                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }

        stage("Deploy") {
            steps {
                sh """
                    sed -i \
                    "s|image:.*|image: ${IMAGE_NAME}:${IMAGE_TAG}|" \
                    k8s/deployment.yaml

                    kubectl apply -f k8s/
                """
            }
        }
    }

    post {
        success {
            echo "Deployment successful!"
        }

        failure {
            echo "Pipeline failed!"
        }
    }
}
