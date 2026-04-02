pipeline {
  agent any
  stages {
    stage ("Clean Up Stage") {
      steps {
        echo "Cleaning up..."
        sh "docker stop fl || true"
        sh "docker rm fl || true"
      }
    }
    stage ("Set Up Stage") {
      steps {
        echo "Setting up..."
        sh "curl localhost"
      }
    }
    stage ("Trivy Filesystem Scan") {
      steps {
        sh "trivy fs / -f json -o trivy-result.json"
        archiveArtifacts artifacts: 'trivy-result.json', followSymlinks: false
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
      steps {
        sh "python3 test.py"
        //sh returnStatus: true, script: "python3 test.py"
        //script {
          //def ret = sh returnStatus: true, script: "python3 test.py"
          //if (ret == 0) {
            //sh "echo \"Success\""
          //} else {
            //sh "echo \"Failed\""
          //}
        //}
      }
    }
  }
}

