// pipeline {
//     agent any

//     environment {
//         GIT_URL = 'https://github.com/Palatable001/mydemo.git/'
//         BACKEND_DIR = 'MyFirstDemoWithSpring'
//         FRONTEND_DIR = 'frontend'
//         GIT_CREDENTIALS = 'Github-credentials'
//         DOCKERHUB_CREDENTIALS = 'dockerhub-credentials'
//     }

//     stages {
//         // stage('Checkout') {
//         //     steps {
//         //         withCredentials([usernamePassword(credentialsId: "${GIT_CREDENTIALS}", passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
//         //             git credentialsId: "${GIT_CREDENTIALS}", url: GIT_URL
//         //         }
//         //         // Add echo to check GIT_COMMIT and VERSION_TAG
//         //         script {
//         //             echo "GIT_COMMIT: ${GIT_COMMIT}"
//         //             echo "VERSION_TAG: ${VERSION_TAG}"
//         //         }
//         //     }
//         // }

//         stage('Build and Push MyFirstDemoWithSpring Docker Image') {
//     steps {
//         script {
//             withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
//                 dir('MyFristDemoWithSpring') {
//                     echo "Building backend Docker image..."
//                     // Ensure the target folder is present
//                     sh 'ls -al MyFristDemoWithSpring/target/'
                    
//                     sh 'docker build -t palatable001/my_java_app:latest .'
                    
//                     echo "Logging in to DockerHub..."
//                     sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                    
//                     echo "Pushing backend Docker image..."
//                     sh "docker tag palatable001/my_java_app:latest palatable001/my_java_app:latest"
//                     sh "docker push palatable001/my_java_app:latest"
//                 }
//             }
//         }
//     }
// }


//         stage('Build and Push Frontend Docker Image') {
//             steps {
//                 script {
//                     withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
//                         dir('frontend') {
//                             echo "Building frontend Docker image..."
//                             sh 'docker build -t palatable001/frontend-service:${VERSION_TAG} .'
                            
//                             echo "Logging in to DockerHub..."
//                             sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                            
//                             echo "Pushing frontend Docker image..."
//                             sh "docker tag palatable001/frontend-service:${VERSION_TAG} palatable001/frontend-service:latest"
//                             sh "docker push palatable001/frontend-service:latest"
//                         }
//                     }
//                 }
//             }
//         }

//         //  stage('Deploy to GKE') {
//         //     steps {
//         //         script {

//         //             echo "Deploying to GKE..."
//         //             sh '''
//         //                 kubectl apply -f config.yaml
                        
//         //             '''
//         //         }
//         //     }
//         // }
//     }

//     post {
//         always {
//             echo 'Cleaning up workspace'
//             cleanWs()
//         }
//         success {
//             echo 'Build and tests succeeded!'
//         }
//         failure {
//             echo 'Build or tests failed!'
//         }
//     }
// }


pipeline {
    agent any

    environment {
        GIT_URL = 'https://github.com/Palatable001/mydemo.git/'
        BACKEND_DIR = 'MyFristDemoWithSpring'
        FRONTEND_DIR = 'frontend'
        GIT_CREDENTIALS = 'Github-credentials'
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials'
    }

    stages {
        // stage('Build and Push MyFirstDemoWithSpring Docker Image') {
        //     steps {
        //         script {
        //             withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
        //                 dir('MyFristDemoWithSpring') { // Fixed directory name
        //                     echo "Building backend Docker image..."
        //                     // Ensure the target folder is present
        //                     // sh 'ls -al'
                            
        //                     // Build the Docker image
        //                     sh 'docker build -t palatable001/my_java_app:latest .'
                            
        //                     echo "Logging in to DockerHub..."
        //                     sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                            
        //                     echo "Pushing backend Docker image..."
        //                     sh "docker tag michaeladegoke/my_java_app:latest michaeladegoke/my_java_app:latest"
        //                     sh "docker push michaeladegoke/my_java_app:latest"
        //                 }
        //             }
        //         }
        //     }
        // }

        // stage('Build and Push Frontend Docker Image') {
        //     steps {
        //         script {
        //             withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
        //                 dir('frontend') {
        //                     echo "Building frontend Docker image..."
        //                     sh 'docker build -t michaeladegoke/frontend-service:${VERSION_TAG} .'
                            
        //                     echo "Logging in to DockerHub..."
        //                     sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                            
        //                     echo "Pushing frontend Docker image..."
        //                     sh "docker tag michaeladegoke/frontend-service:${VERSION_TAG} michaeladegoke/frontend-service:latest"
        //                     sh "docker push michaeladegoke/frontend-service:latest"
        //                 }
        //             }
        //         }
        //     }
        // }
            stage('Build and Push Frontend Docker Image') {
                steps {
                    script {
                        withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                            dir('frontend') {
                                echo "Building frontend Docker image..."
                    
                                // Check if VERSION_TAG is set, otherwise use 'latest'
                                def versionTag = env.VERSION_TAG ?: 'latest'

                                // Build the Docker image with the correct tag
                                sh "docker build -t michaeladegoke/frontend-service:${versionTag} ."
                    
                                echo "Logging in to DockerHub..."
                                sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                    
                                echo "Pushing frontend Docker image..."
                                sh "docker tag michaeladegoke/frontend-service:${versionTag} michaeladegoke/frontend-service:latest"
                                sh "docker push michaeladegoke/frontend-service:latest"
                            }
                        }
                    }
                }
            }

        //  stage('Build and Push MyFristDemoWithSpring Docker Image') {
        //     steps {
        //         script {
        //             withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
        //                 dir('MyFristDemoWithSpring') { // Fixed directory name
        //                     echo "Building backend Docker image..."
                            
        //                     // Build the Docker image with the correct DockerHub username
        //                     sh 'docker build -t michaeladegoke/my_java_app:latest .'
                            
        //                     echo "Logging in to DockerHub..."
        //                     sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                            
        //                     echo "Pushing backend Docker image..."
        //                     sh "docker push michaeladegoke/my_java_app:latest"
        //                 }
        //             }
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
