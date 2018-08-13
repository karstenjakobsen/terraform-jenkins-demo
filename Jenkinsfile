def pullRequest = false

ansiColor('xterm') {

  node {

    // Set github status that the images could be built successfully
    step([$class: 'GitHubSetCommitStatusBuilder'])
    checkout scm

    // we don't release or ask for user input on pull requests
    pullRequest = env.BRANCH_NAME != 'master'
   

    stage('init') {

        sh """
	  pwd
 	  ls -last
          terraform init
        """

    }

    stage('plan') {

        sh """
          terraform plan -out plan.plan
        """
      
    }

    stage('show'){
      sh "terraform show   plan.plan"

      // Save plan output for future so they can be compared
      archiveArtifacts 'plan.plan'

      // store the plan file to be used later on potentially different node
      stash includes: 'plan.plan', name: 'plans'

    }

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

// Re-alocate a new node for apply
ansiColor('xterm') {

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
}

