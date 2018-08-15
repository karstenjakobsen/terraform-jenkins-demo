pipeline {

    agent {
        node {
            label 'master'
        }
    }

    environment {
      DOCKER_CMD='docker -H 127.0.0.1:2375'
      TERRAFORM_PATH='${WORKSPACE}/terraform/odn1/hp/voip/'
      TERRAFORM_CMD = "${DOCKER_CMD} run --net=host -w /data -v /root/.ssh:/root/.ssh -v `pwd`:/data -e GIT_SSH_COMMAND='ssh -i /root/.ssh/id_rsa -oStrictHostKeyChecking=no' ${TERRAFORM_IMAGE}"
    }

    stages {

        stage('checkout repo') {
            steps {
              checkout scm
            }
        }

	stage('get deployment path from comments') {
            steps {
                sh  """
		    sh scripts/get_path.sh
                    """
            }
        }

        stage('pull terraform image') {
            steps {
                sh  """
                    ${DOCKER_CMD} pull $TERRAFORM_IMAGE
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
