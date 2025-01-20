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
	stage('Run Docker Registry') {
	    steps {
		script {
		    sh """
		    docker inspect registry || docker run -d -p 5000:5000 --name registry registry:2 || true
		    """
		}
	    }
	}
    }
}
