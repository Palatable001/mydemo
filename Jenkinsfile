pipeline {
    agent any

    environment {
        GIT_URL = 'https://github.com/Palatable001/mydemo.git/'
        BACKEND_DIR = 'MyFirstDemoWithSpring'
        FRONTEND_DIR = 'frontend'
        GIT_CREDENTIALS = 'Github-credentials'
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials'
    }

    stages {
        // stage('Checkout') {
        //     steps {
        //         withCredentials([usernamePassword(credentialsId: "${GIT_CREDENTIALS}", passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
        //             git credentialsId: "${GIT_CREDENTIALS}", url: GIT_URL
        //         }
        //         // Add echo to check GIT_COMMIT and VERSION_TAG
        //         script {
        //             echo "GIT_COMMIT: ${GIT_COMMIT}"
        //             echo "VERSION_TAG: ${VERSION_TAG}"
        //         }
        //     }
        // }

        stage('Build and Push MyFirstDemoWithSpring Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        dir('MyFristDemoWithSpring') {
                            echo "Building backend Docker image..."
                            // Ensure the target folder is present
                            sh 'ls -al MyFristDemoWithSpring/target/'
                            
                            sh 'docker build -t palatable001/my_java_app:latest .'
                            
                            echo "Logging in to DockerHub..."
                            sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                            
                            echo "Pushing backend Docker image..."
                            sh "docker tag palatable001/my_java_app:latest palatable001/my_java_app:latest"
                            sh "docker push palatable001/my_java_app:latest"
                        }
                    }
                }
            }
        }

        stage('Build and Push Frontend Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        dir('frontend') {
                            echo "Building frontend Docker image..."
                            sh 'docker build -t palatable001/frontend-service:${VERSION_TAG} .'
                            
                            echo "Logging in to DockerHub..."
                            sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                            
                            echo "Pushing frontend Docker image..."
                            sh "docker tag palatable001/frontend-service:${VERSION_TAG} palatable001/frontend-service:latest"
                            sh "docker push palatable001/frontend-service:latest"
                        }
                    }
                }
            }
        }

        //  stage('Deploy to GKE') {
        //     steps {
        //         script {

        //             echo "Deploying to GKE..."
        //             sh '''
        //                 kubectl apply -f config.yaml
                        
        //             '''
        //         }
        //     }
        // }
    }

    post {
        always {
            echo 'Cleaning up workspace'
            cleanWs()
        }
        success {
            echo 'Build and tests succeeded!'
        }
        failure {
            echo 'Build or tests failed!'
        }
    }
}