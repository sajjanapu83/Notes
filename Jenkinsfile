pipeline {
  agent any
  stages {
    stage('Stage1') {
      parallel {
        stage('Stage1') {
          steps {
            build(job: 'HelloWorld', propagate: true)
          }
        }
        stage('Stage2') {
          steps {
            build(job: 'HelloWorld', propagate: true, quietPeriod: 5, wait: true)
          }
        }
        stage('Stage3') {
          steps {
            script {
              echo "Arbitary script"
            }

          }
        }
      }
    }
    stage('End') {
      steps {
        script {
          echo "script !!!"
        }

      }
    }
  }
}
