pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/shawndavis1/playwright-docker-prototype.git'
            }
        }

stage('Debug Env') {
    steps {
        bat 'echo NODE_ENV=%NODE_ENV%'
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
                docker run --rm -v C:\ProgramData\Jenkins\.jenkins\workspace\Playwright-Docker-CI\artifacts:/app/artifacts playwright-tests
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
                    reportName: 'Playwright HTML Report',
                    keepAll: true,
                    alwaysLinkToLastBuild: true,
                    allowMissing: true
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