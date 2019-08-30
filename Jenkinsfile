pipeline {
  agent any
   stages {
   stage('build'){
   steps{
      sh 'docker build . Dockerfile '
   }
   }
      stage('Test') {
              steps {
                 
                     sh 'docker run -it myDockerImage'
                    echo "docker image tested"
                    }
           }
          stage('Deploy') {
              steps {
              sh 'docker run -it  myDockerImage'
                    sh 'docker push naveenkumaraluthuri myDockerImage'
                  }
            }
  }
 }
