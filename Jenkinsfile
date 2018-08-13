pipeline {
	
	agent any

	environment {
		TERRAFORM_CMD='${WORKSPACE}/bin/terraform'		
		TERRAFORM_PATH='${WORKSPACE}/terraform/odn1/hp/voip/'		
		GIT_SSH_COMMAND='ssh -i /var/jenkins_home/.ssh/id_rsa -oStrictHostKeyChecking=no'
		TF_LOG='INFO'
		TF_VAR_vsphere_password='${VSPHERE_PASSWORD}'
		
	}

	stages {

		stage('checkout') { 			
			steps {
				checkout scm 
			}
		}

		stage('install terraform') {
			steps {
				sh """	
				sh scripts/step_install_terraform.sh		
				"""    
			}
		}  

		stage('terraform init') {
			steps {
				sh """				
				cd ${TERRAFORM_PATH}						
				${TERRAFORM_CMD} init
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

		stage('show'){
			
			steps {
				sh "${TERRAFORM_CMD} show plan.plan"

				// Save plan output for future so they can be compared
				archiveArtifacts 'plan.plan'

				// store the plan file to be used later on potentially different node
				stash includes: 'plan.plan', name: 'plans'
			}

		}

	}

}

// We don't run the rest of the code when we aren't running in master branch
// So pull requests only run a plan
if(pullRequest){
  return
}
