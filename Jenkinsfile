pipeline {
    agent any 
    environment{
        AWS_REGION="eu-north-1"
    }
    stages{
        stage('checkout'){
            steps{
                echo "checking github repo"
                git url: "https://github.com/ramsrikanthpabbineedi/jenkinsfile.git"
            }
        }
        stage('terraform formate'){
            steps{
                echo "terraform formate checking"
                sh 'terraform fmt -check -recursive'
            }
        }
        stage('terraform init'){
            steps{
                echo "initalization requried sources"
                withAWS(credentials: 'aws_id',region: "${AWS_REGION}"){
                    sh 'terraform init -input=false'
                }
            }
        }
        stage('terraform validate'){
            steps{
                echo "validating code"
                withAWS(credentials: 'aws_id',region: "${AWS_REGION}"){
                    sh 'terraform validate '
                }
            }
        }
        stage('terraform plan'){
            steps{
                echo "paln is runing don't worry"
                withAWS(credentials: 'aws_id',region: "${AWS_REGION}"){
                    sh 'terraform plan -out=tfplan -input=false'
                }
            }
        }
        stage('terraform apply'){
            steps{
                echo  "applying the code "
                withAWS(credentials: 'aws_id',region: "${AWS_REGION}"){
                    sh 'terraform apply -auto-approve tfplan '
                }
            }
        }

    }
    post{
        success{
            echo "done .... great job"
        }
        failure{
            echo "don't worry try again"
        }
        always{
            cleanWs()
        }
    }
}