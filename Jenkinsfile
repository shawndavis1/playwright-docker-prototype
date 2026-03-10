pipeline {
  agent {
    docker {
      image 'mcr.microsoft.com/playwright:v1.58.0-jammy'
      args '-u root'
    }
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Install Dependencies') {
      steps {
        sh 'npm ci'
      }
    }

    stage('Run Playwright Tests') {
      steps {
        sh 'npx playwright test --reporter=junit,html'
      }
    }

    stage('Publish JUnit') {
      steps {
        junit '**/results.xml'
      }
    }

    stage('Publish HTML Report') {
    steps {
        publishHTML(target: [
            reportDir: 'playwright-report',
            reportFiles: 'index.html',
            reportName: 'Playwright Report',
            keepAll: true,
            alwaysLinkToLastBuild: true,
            allowMissing: true
        ])
    }
}

  }

  post {
    always {
      archiveArtifacts artifacts: 'playwright-report/**'
    }
  }
}