pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'

            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                bat 'dotnet build "frontend/easydevops/FrontendProject.csproj"'

            }
        }
    }
}