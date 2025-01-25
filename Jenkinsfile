pipeline {
    agent any
    environment {
	DOCKER_IMAGE = 'my-project:latest'
	LOCAL_REGISTRY = 'localhost:5000'
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
		    echo "Runs shell to run registry"
		    sh 'chmod +x ./shell.sh'
		    sh './shell.sh'
		}
	    }
	}
	stage('Tag and push image') {
	    steps {
		script {
		    sh """
			docker tag ${DOCKER_IMAGE} ${LOCAL_REGISTRY}/${DOCKER_IMAGE}
			docker push ${LOCAL_REGISTRY}/${DOCKER_IMAGE}
		    """
		}
	    }
	}
	stage('Deploying image') {
	    steps {
		script {
		    sh """
			docker stop my-container || true
			docker rm my-container || true
			docker run -d -p 3000:80 --name my-container ${LOCAL_REGISTRY}/${DOCKER_IMAGE}
		    """
		}
	    }
	}
    }
}
