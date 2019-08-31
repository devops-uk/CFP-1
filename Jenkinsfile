pipeline {
  agent any
   stages {
   stage('build'){
   steps{
      sh 'sudo docker build -t my-image/dockerfile .'
   }
   }
      stage('Test') {
              steps {
                 
                     sh 'docker run -it dockerfile'
                    echo "docker image tested"
                    }
           }
          stage('Deploy') {
              steps {
              sh 'docker run -it  Dockerfile'
                    sh 'docker push naveenkumaraluthuri Dockerfile'
                  }
            }
  }
 }
