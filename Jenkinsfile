pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "Building the project..."
                sh '''
                echo "build prj"
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing..."
                sh '''
                echo "test prj"
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo "Deliver..."
                sh '''
                echo "doing delivery"
                '''
            }
        }
    }
}