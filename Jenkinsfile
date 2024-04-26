def hello(Map map) {
    // echo "Hello ${map.name}"
    def db = "Hello ${map.name}"
    echo "${db}"
}

def sayHello(name="Daniel") {
    echo "Hello $name!"
}

def damnSh(someVar) {
    sh ("echo 'somevar = $someVar'")
}


def catFile(filename) {
    sh """
    cat $filename
    """
}

pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                echo "step build"
                hello(name: "Daniel")
                sh "echo 'this is test' > /tmp/testfile.txt "
                catFile("/tmp/testfile.txt")
                sayHello()
                sayHello("Goro!")
            }
        }
    }
}
