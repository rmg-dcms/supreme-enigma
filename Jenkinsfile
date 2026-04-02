pipeline {
  agent any
  stages {
    stage ("Clean Up Stage") {
      steps {
        sh "echo \"cleaning up...\""
      }
    }
    stage ("Set Up Stage") {
      steps {
        sh "echo \"setting up...\""
      }
    }
    stage ("Build images") {
      steps {
        sh "docker build -t flask-app ."
      }
    }
    stage ("Run container") {
      steps {
        sh "docker run -d -p 5500:80 --name fl flask-app"
      }
    }
  }
}

