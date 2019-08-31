pipeline {
    agent any
        stages {
          stage('build') {
              steps{
                   sh 'sudo docker build -t my-image/dockerfile .'
                  }
          }
          stage('Test') {
              steps {
                  sh 'docker run -it  my-image'
                    echo "docker image tested"
                    }
           }
          stage('Deploy') {
              steps {
                    sh 'docker run -it my-image'
                    sh 'docker push naveenkumaraluthuri Dockerfile'
                  }
            }
      }
 }
