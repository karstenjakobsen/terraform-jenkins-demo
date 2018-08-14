pipeline {
    
    agent {
        node {
            label 'master'
        }
    }

    environment {
        TERRAFORM_PATH='${WORKSPACE}/terraform/odn1/hp/voip/'
        TERRAFORM_CMD = "docker run -w /data -v `pwd`:/data ${TERRAFORM_IMAGE}"
        GIT_SSH_COMMAND='ssh -i /root/.ssh/id_rsa -oStrictHostKeyChecking=no'	
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
