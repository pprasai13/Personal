FROM jenkins/jenkins:2.249.1-jdk11

COPY jenkins-resources/plugins.txt /usr/share/jenkins/ref/plugin.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugin.txt

COPY jenkins-resources/jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml
COPY jenkins-resources/slaveTestJob.xml /usr/share/jenkins/ref/jobs/slave-test/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false