pipeline {
    environment {
      DOCKER = credentials('docker-hub')
    }
  agent any
  stages {
// Building your Test Images
    stage('BUILDING') {
          steps {
            sh 'docker build .'
          }
        }
        stage('Test image') {
          steps {
            sh 'docker build  .'
          }
        }
    stage('TESTING') {
      parallel {
        stage('RUN') {
          steps {
           // sh 'docker run --name nodeapp --network="bridge" -d \-p 8080:8080 .'
            sh 'docker run -d -it dockerfile .'
          }
        }
        stage('PUSH') {
            steps {
            sh 'docker push sravanik138/nodeapp:latest'
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
        }
  }
}
