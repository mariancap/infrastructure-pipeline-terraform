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
        stage('Ansible run'){
            steps{
                sh 'ansible-playbook -i inventory tomcatinstall.yml'
            }
        }


        
    }
}
