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
                echo 'Testing..'
                sleep 3
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            
            }
        }
    }
}