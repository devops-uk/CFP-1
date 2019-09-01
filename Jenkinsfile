 pipeline {
  agent any
   stages {
    stage('pull'){
   steps{
      sh 'docker pull python'
    }
   }
   stage('build'){
   steps{
      sh 'docker build .'
   }
   }
  }
 }
