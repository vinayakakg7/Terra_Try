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
                  withCredentials([<object of type [com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]]) {
                        bat 'terraform init'
                }
            }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    withCredentials([<object of type [com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]]) {
                      bat 'terraform plan'
                }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    withCredentials([<object of type [com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]]) {
                        bat 'terraform apply -auto-approve'
                }
                }
            }
        }
    }
}
