pipeline {
    agent any

    tools {
        maven 'maven'
        jdk 'Java'
    }

    environment{
        GIT_REPO = 'https://github.com/vinayakakg7/Terra_Try.git'
        GIT_BRANCH = 'main'
    }

    stages {
        stage('Clone Git repository') {
            steps {
                git branch: GIT_BRANCH, url: GIT_REPO
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                  withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_CREDENTIALS']]) {
                        bat 'terraform init'
                }
            }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_CREDENTIALS']]) {
                      bat 'terraform plan'
                }
                }
            }
        }

        stage('Terraform Action') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_CREDENTIALS']]) {
            // Get the value of the "terra" parameter
					def terra = params.terra

            // Check if the "terra" parameter is set to "destroy"
					if (terra == 'destroy') {
                      echo 'Destroying infrastructure...'
                      bat "terraform destroy --auto-approve"
                      error "Aborting the pipeline after destroying infrastructure" // Stop the pipeline after the destroy command
                    } else {
                          echo 'Applying infrastructure...'
                          bat "terraform apply --auto-approve"
                        }
                }
                }
            }
        }
    }
}
