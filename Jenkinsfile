pipeline {
    environment {
      DOCKER = credentials('docker-hub')
    }
  agent any
  stages {
// Building your Test Images
    stage('BUILD') {
      parallel {
        stage('Image') {
          steps {
            sh 'docker build -f express-image/Dockerfile .'
          }
        }
        stage('Test') {
          steps {
            sh 'docker build -f test-image/Dockerfile .'
          }
        }
      }
      post {
        failure {
            echo 'This build has failed. See logs for details.'
        }
      }
    }
// Performing Software Tests
    stage('TEST') {
      parallel {
        stage('RUN') {
          steps {
           // sh 'docker run --name nodeapp --network="bridge" -d \-p 8080:8080 .'
            sh 'docker run -d -it dockerfile .'
          }
        }
        stage('Quality Tests') {
          steps {
            sh 'docker login --username $DOCKER_USR --password $DOCKER_PSW'
            sh 'docker push <DockerHub Username>/nodeapp-dev:latest'
          }
        }
      }
      post {
        success {
            echo 'Build succeeded.'
        }
        unstable {
            echo 'This build returned an unstable status.'
        }
        failure {
            echo 'This build has failed. See logs for details.'
        }
      }
    }
// Deploying your Software
    stage('DEPLOY') {
          when {
           branch 'docker'  //only run these steps on the docker branch
          }
            steps {
                    retry(3) {
                        timeout(time:10, unit: 'MINUTES') {
                            sh 'docker tag nodeapp:trunk <DockerHub Username>/nodeapp:latest'
                            sh 'docker push <GITHub Username>/nodeapp:latest'
                            sh 'docker save <GITHub Username>/nodeapp:latest | gzip > nodeapp-golden.tar.gz'
                        }
                    }

            }
            post {
                failure {
                    sh 'docker stop nodeapp test-image'
                    sh 'docker system prune -f'
                    deleteDir()
                }
            }
    }
// Doing containers clean-up to avoid conflicts in future builds
    stage('CLEAN-UP') {
      steps {
        sh 'docker stop nodeapp-dev test-image'
        sh 'docker system prune -f'
        deleteDir()
      }
    }
  }
}
