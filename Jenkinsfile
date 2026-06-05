pipeline{
    agent any
    stages{
        stage("Clone Repository"){
            steps{
                echo "Cloning started"

                git branch: "main",
                url: "https://github.com/sanjeevprasad-25/azure-devops-project.git"
                }
            post{
                success{
                    echo "========Cloning successfully========"
                }
                failure{
                    echo "========Cloning failed========"
                }
            }
        }
         stage("Initializing terraform"){
            steps{
                echo "Initialize Terraform"
                sh 'terraform init'
                 }
            post{
                success{
                    echo "========Initialized successfully========"
                }
                failure{
                    echo "========Initialization failed========"
                }
            }
        }
         stage("Validating and Planning terraform"){
            steps{
                echo "Validate Terraform"
                sh 'terraform validate'
                echo "Plan Terraform"
                sh 'terraform plan -out=tfplan'
                sh 'ls -l'
                 }
            post{
                success{
                    echo "========Validating and Planning successfully========"
                }
                failure{
                    echo "========Validation and Planning failed========"
                }
            }
        }
             stage("Applying terraform"){
            steps{
                echo "Apply Terraform"
                sh 'terraform apply --auto-approve tfplan'
                  }
            post{
                success{
                    echo "========Applied successfully========"
                }
                failure{
                    echo "========Applied failed========"
                }
            }
        } 

    }
    post{
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}