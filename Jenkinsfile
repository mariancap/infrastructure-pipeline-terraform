pipeline {
	agent any

	environment{
		AWS_ACCES_KEY_ID = credentials('aws-access-key-id')
		AWS_SECRET_ACCES_KEY = credentials('aws-secret-access-key')
		AWS_DEFAULT_REGION = 'us-east-1'
}
	stages {
		stage('Terraform init') {
			steps{
				sh 'terraform init'
			}
		}



		stage('Terraform plan') {
                        steps{
                                sh 'terraform plan'
                        }
                }

		stage('Terraform apply') {
                        steps{
                                sh 'terraform apply --auto-approve'
                        }
                }
	}

}
