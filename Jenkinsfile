pipeline {
    
    agent {
        node {
            label 'master'
        }
    }

    environment {
        TERRAFORM_PATH='${WORKSPACE}/terraform/odn1/hp/voip/'
        TERRAFORM_CMD = "docker run --rm -v `pwd`:/data -e TF_VAR_vsphere_password=${VSPHERE_PASSWORD} -e TF_LOG='ERROR' ${TERRAFORM_IMAGE}"
        GIT_SSH_COMMAND='ssh -i /var/jenkins_home/.ssh/id_rsa -oStrictHostKeyChecking=no'
    }
    
    stages {
        
        stage('checkout repo') {
            steps {
              checkout scm
            }
        }
    
        stage('pull terraform image') {
            steps {
                sh  """
                    docker pull $TERRAFORM_IMAGE
                    """
            }
        }
        
        stage('terraform test') {
            
            steps {
                sh  """
                    ${TERRAFORM_CMD} --version
                    """
            }
        }
        
        stage('terraform init') {
            
            steps {
                sh  """
                    cd ${TERRAFORM_PATH}
                    ${TERRAFORM_CMD} init -input=false
                    """
            }
        
        }
        
        stage('terraform plan') {
            
			steps {
				sh """
				cd ${TERRAFORM_PATH}
				${TERRAFORM_CMD} plan -out plan.plan
				"""
			}

		}
    }
}
