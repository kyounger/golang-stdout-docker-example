pipeline {
    agent {
        kubernetes {
        label 'kaniko-build'
        yaml """
kind: Pod
metadata:
  name: kaniko
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug-v0.10.0
    imagePullPolicy: Always
    command:
    - /busybox/cat
    tty: true
    volumeMounts:
      - name: jenkins-docker-cfg
        mountPath: /kaniko/.docker
  volumes:
  - name: jenkins-docker-cfg
    projected:
      sources:
      - secret:
          name: docker-credentials
          items:
            - key: .dockerconfigjson
              path: config.json
"""
        }
    }
    stages {
        stage('Build with Kaniko') {
            steps {

                git branch: 'master',
                    url: 'https://github.com/kyounger/golang-stdout-docker-example'

                container(name: 'kaniko', shell: '/busybox/sh') {
                    withEnv(['PATH+EXTRA=/busybox']) {
                        //works
                        sh '''#!/busybox/sh
                        /kaniko/executor --context=`pwd` --no-push --cleanup
                        '''
                    }
                }

            }
        }
    }
}
