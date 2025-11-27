pipeline {
    agent {label "training"}

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/bgs505/simple-apps.git'
            }
        }
        stage('Build') {
            steps {
                sh '''cd apps
                npm install'''
            }
        }
        stage('Testing') {
            steps {
                sh '''cd apps
                npm test
                npm run test:coverage'''
            }
        }
        stage('Code Review') {
            steps {
                sh '''sonar \
                -Dsonar.host.url=http://172.23.12.116:9000 \
                -Dsonar.token=sqp_13bacf07f7d047b2ff71e4ca98ffc906ae24e604 \
                -Dsonar.projectKey=simple-apps-116'''
            }
        }
        stage('Deploy compose') {
            steps {
                sh '''
                docker compose build
                docker compose up -d
                '''
            }
        }
    }
}