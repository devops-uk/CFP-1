 pipeline {
  agent any
   stages {
   stage('build'){
   steps{
      sh 'docker build .'
   }
    stage('Test'){
   steps{
      sh 'docker build .'
      sh 'docker run -it -d .'
   }
   }
    stage('Deploy'){
   steps{
      sh 'docker push sravanik138/nodeapp'
   }
  }
 }
