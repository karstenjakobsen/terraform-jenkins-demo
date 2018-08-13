def pullRequest = false

pipeline {
	
	agent any

	environment {
		TERRAFORM_CMD = '${WORKSPACE}/bin/terraform'
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

		// we don't release or ask for user input on pull requests
		pullRequest = env.BRANCH_NAME != 'master'    

		stage('terraform init') {
			steps {
				sh """
				cd terraform/odn1/hp/voip/		
				${TERRAFORM_CMD} init
				"""
			}

		}

		stage('terraform plan') {
			steps {
				sh """
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
