pipeline {
    agent {
      label 'Jenkins-Build'
    }
    
    environment {
        registry = '787632010529.dkr.ecr.eu-west-1.amazonaws.com/wit-devops-ecr'
    }

    stages {
        stage('Clone git Repo') {
            steps {
                echo 'Checking Out'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHubaccessToken', url: 'https://github.com/ebuque/wit-challenge']]])
            }
        }
        
        
        stage('Docker Build') {
            steps {
                echo 'Building Docker image'
                script{
                dockerImage = docker.build registry
                }

            }
        }
        
     stage('Upload to ECR') {
        steps {
            echo 'Uploading Docker image'
            script{
            sh 'aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 787632010529.dkr.ecr.eu-west-1.amazonaws.com'
            sh 'docker push 787632010529.dkr.ecr.eu-west-1.amazonaws.com/wit-devops-ecr:latest'
            }

        }
        }
    }
    
}
