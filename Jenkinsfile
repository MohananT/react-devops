pipeline {
    agent any
    environment {
	DOCKER_IMAGE = 'my-project:latest'
    }
    stages {
        stage('Checkout code') {
            steps {
                echo "Building the project..."
                sh '''
                echo "build prj"
                '''
		checkout scm
            }
        }
	stage('Build Image') {
	    steps {
		script {
		    echo 'building docker image'
		    sh "docker build -t ${DOCKER_IMAGE} ."
		}
	    }	
	}
    }
}
