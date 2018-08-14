pipeline {
    
    agent {
        node {
            label 'master'
        }
    }

    environment {
	GIT_SSH_COMMAND='ssh -i /root/.ssh/id_rsa -oStrictHostKeyChecking=no'	
        TERRAFORM_PATH='${WORKSPACE}/terraform/odn1/hp/voip/'
    	TERRAFORM_CMD = "docker run -w /data -v /root/.ssh:/root/.ssh -v `pwd`:/data -e GIT_SSH_COMMAND=${GIT_SSH_COMMAND} ${TERRAFORM_IMAGE}"
     
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
		    pwd
		    ls -lah
                    ${TERRAFORM_CMD} init
                    """
            }
        
        }
        
        stage('terraform plan') {
            
			steps {
				sh """
				cd ${TERRAFORM_PATH}
				${TERRAFORM_CMD} plan -var "vsphere_password=${VSPHERE_PASSWORD}" -out plan.plan
				"""
			}

		}
    }
}
