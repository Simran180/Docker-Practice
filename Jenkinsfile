pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'echo "Build step completed"'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'echo "Test step completed"'
                sh 'git ls-remote --heads origin'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'echo "Deploy step completed"'
            }
        }
        stage('Check Webhook') {
            steps {
                echo 'Checked'
                sh 'echo "Checked"'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

