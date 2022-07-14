pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                    echo 'Deploying....'
                    bucket="gs:://study_bucket_bb01183/"
                    GIT_COMMIT=$(git rev-parse HEAD)
                    echo "GIT COMMIT $GIT_COMMIT"
                    echo "COMMIT $COMMIT"
                    git show $GIT_COMMIT|grep "^diff"|awk '{print $3}' |cut -d '/' -f 2- > Change_file.txt
                    echo "Changed Files :: "
                    while read line; do
                        echo $line
                    done<Change_file.txt
                    cat Change_file.txt
                    echo $WORKSPACE
                    git clone https://github.com/RoitPanwar/Rohit_Training.git
                '''
            }
        }
    }
}
