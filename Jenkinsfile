pipeline {
    agent any

    environment {
        AWS_REGION = "eu-west-2"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Sholly45/terraform-s3.git'
            }
        }

        stage('Setup Terraform') {
            steps {
                sh '''
                terraform init
                terraform validate
                '''
            }
        }

        stage('Apply Terraform (Provision)') {
            steps {
                sh '''
                terraform apply -auto-approve
                INSTANCE_ID=$(terraform output -raw instance_id)
                echo "INSTANCE_ID=$INSTANCE_ID" > instance_id.txt
                '''
            }
        }

        stage('Wait 3 Minutes') {
            steps {
                script {
                    sleep 180 // Wait for 3 minutes
                }
            }
        }

        stage('Destroy Terraform (Terminate)') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    post {
        always {
            echo "Terraform Execution Complete"
        }
    }
}

