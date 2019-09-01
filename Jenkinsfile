 pipeline {
  agent any
   stages {
   stage('build'){
   steps{
      sh 'docker build -f Dockerfile .'
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
                  }
            }
  }
 }
