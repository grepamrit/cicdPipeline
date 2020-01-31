pipeline {
  agent none
  stages {
    stage('Build') {
      agent any
      post {
        failure {
          emailext(subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}", attachLog: true, to: 'sushan@moco.com.np', from: 'sysadmin@moco.com.np')
        }

      }
      steps {
        sh 'mvn clean install'
      }
    }

    stage('Test') {
      agent any
      post {
        always {
          emailext(subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}", attachLog: true, to: 'sushan@moco.com.np', from: 'sysadmin@moco.com.np')
        }

      }
      steps {
        sh '''echo `pwd`
'''
        sh 'sh jenkins/scripts/test.sh'
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
  options {
    skipStagesAfterUnstable()
  }
}