### http://JenkinsHostname:8080/api/
### http://JenkinsHostname:8080/me/configure -> To Get Access Token
### curl -g -u username:token "http://JenkinsHostname:8080/api/json?pretty=true&tree=jobs[name,url]{1}" -> access from shell  
### http://JenkinsHostname:8080/Jobs/jobname/Config.xml  -> using curl we can update the job from shell

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
