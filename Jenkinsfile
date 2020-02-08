pipeline {
  agent any
  stages {
    stage('Build') {
      post {
        failure {
          emailext attachLog: true, body: "${currentBuild.result}: ${BUILD_URL}", subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", to: 'sushan@moco.com.np'
	}
	always {
	  junit 'target/surefire-reports/*xml'
	}

      }
      steps {
        sh 'mvn clean install'
      }
    }

    stage('Test') {
      post {
        always {
          emailext (attachmentsPattern: 'testcase/target/surefire-reports/*html', attachLog: true, body: "${currentBuild.result}: ${BUILD_URL}", subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", to: 'sushan@moco.com.np')
          junit 'testcase/target/surefire-reports/*xml'
	}

      }
      steps {
        sh 'sh jenkins/scripts/test.sh'
        archiveArtifacts 'testcase/target/surefire-reports/*html'
      }
    }

    stage('Deploy') {
      steps {
        sh 'sh jenkins/scripts/deploy.sh'
        input 'Finished using the mockup maven app? (Click "Proceed" to continue)'
        sh 'sh jenkins/scripts/kill.sh'
        sh 'echo Thank You'
      }
      post {
        always {
          emailext attachLog: yes, body: "${currentBuild.result}: ${BUILD_URL}", subject: "Build Notification: ${JOB_NAME}-Build# ${BUILD_NUMBER} ${currentBuild.result}", to: 'sushan@moco.com.np'
        }
    }
   }
  }
  options {
    skipStagesAfterUnstable()
  }
}
