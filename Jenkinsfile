 pipeline {
  agent any
   stages {
    stage('pull'){
   steps{
      sh 'docker pull python'
   }
   stage('build'){
   steps{
      sh 'docker build .'
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
