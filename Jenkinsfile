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
        stage('Find and Replace') {
            steps {
                script {
                    def filePath = '/opt/infrastructure-pipeline-terraform/inventory'
                    def searchText = '@ipaddress@'
                    def replaceText = '192.168.1.1'
                   
                    def file = new File(filePath)
                    def fileContent = file.text
                   
                    // Perform the find and replace operation
                    def updatedContent = fileContent.replaceAll(searchText, replaceText)
                   
                    // Write the updated content back to the file
                    file.write(updatedContent)
                }
            }
        }


        
    }
}
