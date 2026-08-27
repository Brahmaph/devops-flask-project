pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        // stage('Test') {
        //     steps {
        //         bat 'pytest'
        //     }
        // }
           stage('Test') {
               steps {
                   bat 'where python'
                   bat 'python --version'
                   bat 'python -m pip --version'
                   bat 'python -m pytest --version'
               }
           }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t your-image:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push your-image:latest'
            }
        }

        stage('Deploy') {
            steps {
                bat 'docker run -d -p 5000:5000 your-image:latest'
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
