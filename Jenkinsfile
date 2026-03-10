pipeline {
  agent {
    docker {
      image 'mcr.microsoft.com/playwright:v1.58.0-jammy'
      args '-u root'
    }
  }

    stage('Install Dependencies') {
      steps {
        sh 'npm ci'
      }
    }

    stage('Run Tests') {
      steps {
        sh 'npx playwright test --reporter=junit,html'
      }
    }

    stage('Publish Test Results') {
      steps {
        junit 'test-results/*.xml'
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
      archiveArtifacts artifacts: 'playwright-report/**', fingerprint: true
    }
  }
}