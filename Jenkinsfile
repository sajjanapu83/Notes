pipeline {
  agent any
  stages {
    stage('Repeat Block') {
      steps {
        retry(count: 5) {
          echo 'Hello Jenkins !!!'
        }

      }
    }
  }
}