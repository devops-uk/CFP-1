 pipeline {
  agent any
   stages {
   stage('build'){
   steps{
      sh 'docker build .'
   }
  }
    stage('Test'){
   steps{
      sh 'docker run -d -it dockerfile'
   }
   }
    stage('Deploy'){
   steps{
      sh 'docker push sravanik138/nodeapp'
   }
  }
 }
 }
