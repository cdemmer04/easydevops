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
                bat 'cd frontend/easydevops/obj'
                // snykSecurity(
                //     snykInstallation: 'snyk',
                //     snykTokenId: 'snyk-api-token',
                //     // targetFile: 'frontend/easydevops/obj/project.assets.json'
                //     targetFile: 'frontend/easydevops/easydevops.csproj'
                // )
                powershell 'write-host "test haha"'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            
            }
        }
    }
}