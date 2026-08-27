pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                bat 'python -m pip install -r requirements.txt'
                bat 'python -m pytest'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t devops-flask-project:latest .'
            }
        }

        stage('Deploy') {
            steps {
                bat 'docker rm -f devops-flask-project || exit 0'
                bat 'docker run -d --name devops-flask-project -p 5000:5000 devops-flask-project:latest'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
