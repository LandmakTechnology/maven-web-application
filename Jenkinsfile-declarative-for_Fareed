pipeline {
  agent any
  tools {
    maven "maven3.9.15"
  }
  stages {
    stage('1GetCode'){
      steps{
        sh "echo 'cloning the latest application version' "
        git branch: 'feature', credentialsId: 'GitHubCredentials', url: 'https://github.com/BalogunFareed/maven-web-application'
      } 
    }
    stage('2Test+Build'){
      steps{
        sh "echo 'running JUNIT-test-cases' "
        sh "echo 'testing must pass to create artifacts' "
        sh "mvn clean package"
      }
    }
    stage('3CodeQuality'){
      steps{
        sh "echo 'performing CodeQualityAnalysis' "
        sh "mvn sonar:sonar"
      }
    }
    stage('4UploadtoNexus'){
      steps{
         sh "mvn deploy" 
      }
    }
    stage('5DeploytoProd'){
      steps{
        deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'TomcatDomiCredentials', path: '', url: 'http://18.175.213.63:8177/')], contextPath: null, war: 'target/*war'
      }
    }
  }
  post {
    always{
      emailext body: '''Hey guys,
      Please check build status.
      Thanks
      Balogun Fareed.
      07064101379''', recipientProviders: [buildUser(), developers()], subject: 'success', to: 'balogunfareed22@gmail.com'
    }
    success{
      emailext body: '''Hey guys,
      Good job... build and development is successful.
      Thanks
      Balogun Fareed.
      07064101379''', recipientProviders: [buildUser(), developers()], subject: 'success', to: 'balogunfareed22@gmail.com'
    }
    failure{
      emailext body: '''Hey guys,
      Build failed. Please resolve issues.
      Thanks
      Balogun Fareed.
      07064101379''', recipientProviders: [buildUser(), developers()], subject: 'success', to: 'balogunfareed22@gmail.com'
    }
  }
}
