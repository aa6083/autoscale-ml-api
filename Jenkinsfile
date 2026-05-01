pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'affanalrayyan'
        IMAGE_NAME     = 'ml-inference-api'
        AWS_KEY        = 'projectkey'
    }

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/aa6083/autoscale-ml-api.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t %DOCKERHUB_USER%/%IMAGE_NAME%:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin'
                    sh 'docker push %DOCKERHUB_USER%/%IMAGE_NAME%:latest'
                }
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    dir('terraform') {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve -var="key_name=%AWS_KEY%"'
                    }
                }
            }
        }

        stage('Done') {
            steps {
                dir('terraform') {
                    sh 'terraform output app_url'
                }
                echo '✅ App is LIVE on AWS!'
            }
        }
    }
}