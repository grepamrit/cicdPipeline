pipeline {
	agent none
	options {
		skipStagesAfterUnstable()
	}
	stages {
		stage('Build') {
			agent any
			steps {
				sh 'mvn clean package -Dmaven.test.skip=true'
      				}
			post {
				failure {
             				emailext(subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}", attachLog: true, to: 'sushan@moco.com.np', from: 'sysadmin@moco.com.np')
				}
			}
		}

		stage('Test') {
			agent any
			steps {
				sh 'sh jenkins/scripts/test.sh'
      				}
			post {
				always {
             				emailext(subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}", attachLog: true, to: 'sushan@moco.com.np', from: 'sysadmin@moco.com.np')
				}
			}
		}

		stage('Deploy') {
			agent any
			steps {
				sh 'sh jenkins/scripts/delivery.sh'
				input 'Finished using the mockup maven app? (Click "Proceed" to continue)'
				sh 'sh jenkins/scripts/kill.sh'
				sh 'echo Thank You'
      			}
		}
  	}
}

