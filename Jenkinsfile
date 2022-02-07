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

      stage('SSH'){
        steps([$class: 'BapSshPromotionPublisherPlugin']) {
            sshPublisher(
                continueOnError: false, failOnError: true,
                publishers: [
                    sshPublisherDesc(
                        configName: "HR",//Jenkins 시스템 정보에 사전 입력한 서버 ID
                        verbose: true,
                        transfers: [
                            sshTransfer(
                                sourceFiles: "./te/test2.txt", //전송할 파일
                                removePrefix: "", //파일에서 삭제할 경로가 있다면 작성
                                remoteDirectory: "/home/test1" //배포할 위치  
                                ) 
                          ]
                        )
                    ]
                )
            }
      }

      stage('TF Init&Plan') {

         
        steps {
          withCredentials([string(credentialsId: 'CR', variable: 'test')]) {
            sh 'ls'

            sh 'sshpass -p${test} scp  test2.txt test1@10.2.0.10:/home/test1'
         
            }
            
           
          
          
      
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
