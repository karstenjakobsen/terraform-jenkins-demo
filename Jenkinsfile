def pullRequest = false

node {
	
	environment {
		TERRAFORM_CMD = '${WORKSPACE}/bin/terraform'
    	}

    	stage('checkout') {    
        	checkout scm    
	}
	
	stage('install terraform') {
		sh """	
		sh scripts/step_install_terraform.sh		
		"""      
    	}
    
	// we don't release or ask for user input on pull requests
	pullRequest = env.BRANCH_NAME != 'master'    

	stage('terraform init') {

		sh """
		cd terraform/odn1/hp/voip/		
		${TERRAFORM_CMD} init
		"""

	}
    
	stage('terraform plan') {

		sh """
		${TERRAFORM_CMD} plan -out plan.plan
		"""

	}
    
	stage('show'){

		sh "${TERRAFORM_CMD} show plan.plan"

		// Save plan output for future so they can be compared
		archiveArtifacts 'plan.plan'

		// store the plan file to be used later on potentially different node
		stash includes: 'plan.plan', name: 'plans'

	}

}

// We don't run the rest of the code when we aren't running in master branch
// So pull requests only run a plan
if(pullRequest){
  return
}

// Do not allocate a node as this is a blocking request and should be run on light weight executor 
def userInputEnv = null

//Out side node block to be none blcking
timeout(time: 1, unit: 'HOURS') {
  userInput = input message: 'Are you sure you would like to apply these to production?', 
    parameters: [string(defaultValue: '', description: 'Your name', name: 'name')]
}


node {
    
    stage('install'){
      downloadTerraform()
      env.PATH = "${env.PATH}:${env.WORKSPACE}"
    }

    // restore saved plan file from potentially different node
    unstash name: 'plans'

    stage('apply'){
        sh """
          terraform apply plan.plan
        """
    }
    
}
