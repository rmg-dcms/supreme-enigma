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

