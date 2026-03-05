pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/shawndavis1/playwright-docker-prototype.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t playwright-tests .'
            }
        }

        stage('Run Tests in Container') {
            steps {
                bat '''
                docker run --rm ^
                  -v %WORKSPACE%\\artifacts:/app/artifacts ^
                  playwright-tests
                '''
            }
        }

        stage('Publish JUnit') {
            steps {
                junit 'artifacts/results.xml'
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML([
                    reportDir: 'artifacts/html-report',
                    reportFiles: 'index.html',
                    reportName: 'Playwright HTML Report'
                ])
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'artifacts/**', fingerprint: true
        }
    }
}