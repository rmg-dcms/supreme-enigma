pipeline {
  agent any
  stages {
    stage ("Clean Up Stage") {
      steps {
        sh "echo \"cleaning up...\""
        sh "docker stop fl"
        sh "docker rm fl"
      }
    }
    stage ("Set Up Stage") {
      steps {
        sh "echo \"setting up...\""
      }
    }
    stage ("Trivy Filesystem Scan") {
      steps {
        sh "trivy fs / -f json -o trivy_result.json"
        archiveArtifacts artifacts: 'trivy-results.json', followSymlinks: false
      }
    }
    stage ("Build images") {
      steps {
        sh "docker build -t flask-app ."
      }
    }
    stage ("Run container") {
      steps {
        sh "docker run -d -p 80:5500 --name fl flask-app"
      }
    }
    stage ("Unit Test") {
      sh "python3 test.py"
    }
  }
}

