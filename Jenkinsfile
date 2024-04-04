pipeline {
  agent any
    
  stages{

    stage('terraform') {
      steps {
	sh 'terraform init'
        sh 'terraform apply'
      }
    }
  }
 
}
