pipeline {
    agent any
    environment {
	DOCKER_IMAGE = 'my-project:latest'
    }
    stages {
        stage('Build') {
            steps {
                echo "Building the project..."
                sh '''
                echo "build prj"
                '''
		checkout scm
            }
        }
    }
}
