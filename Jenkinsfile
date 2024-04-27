pipeline{
    agent any
    
    stages{
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/mariancap/infrastructure-pipeline-terraform.git'
            }
        }
        stage('Terraform init'){
            steps{
                sh 'terraform init -upgrade'
            }
        }
        stage('Terraform apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
	stage('sleep'){
            steps{
                sleep 30
            }
        }

	stage('Ansible-playbook run'){
            steps{
                sh 'sudo ansible-playbook tomcatinstall.yml'
            }
        }

        }
}
