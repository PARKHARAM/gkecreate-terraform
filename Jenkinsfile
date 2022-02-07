  pipeline {
    agent any
    tools {
        terraform 'Terraform14'

    }

    stages {  

      stage('Git Checkout') {
        steps {
          git branch: 'main', credentialsId: 'gkfka133', url: 'https://github.com/PARKHARAM/gkecreate-terraform' 
         
        }      
      }

      stage('TF Init&Plan') {
        steps {
          sh 'ssh test1@10.2.0.10'
          sh 't159487'
          sh 'terraform init'
          sh 'terraform plan'
        }      
      }

      

      stage('TF Apply') {
        steps {
          sh 'terraform apply --auto-approve'
          sh 'gcloud projects list'
        }
      }


    } 
  }
