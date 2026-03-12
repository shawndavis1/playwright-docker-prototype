pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/playwright:v1.58.0-jammy'
        }
    }

    stages {
        stage('Run Tests') {
            steps {
                sh 'npm ci'
                sh 'npx playwright test'
            }
        }
    }
}