pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                bat 'dotnet build "frontend/easydevops/easydevops.csproj"'

            }
        }
        stage('Test') {
            steps {
                echo 'Running security test...'
                bat 'cd frontend/easydevops'
                bat 'snyk test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            
            }
        }
    }
}