# Sample CI/CD Pipeline with security checks

This is a small "Hello, World" application to be used as a proof-of-concept for automating security in the CI/CD 
pipeline. 

This pipeline uses:
* _GitHub_ as the source code repository
* _SonarQube_ as the code quality analyzer
* _Concourse_ as the delivery pipeline
* _Maven_ as the build tool
* _Spring Boot_ for the web framework
* _Amazon S3_ for cloud storage of the release build
* _Cloud Foundry_ for the web hosting service


 

Additionally, the repository for the tests is at _https://github.com/ToddBenson/cftest-security.git and the Docker image used 
 is at _https://hub.docker.com/r/tgbenson/security-image/. The Dockerfile is located in the project.


The main project flow:
![alt text](https://github.com/ToddBenson/concourse-maven-spring-boot/blob/master/screenshot.png "Example Pipeline")

Every push to Master:
```
* Clones a repository from GitHub on any push to Master
* Scans JavaScript using Retire.JS and custom eslint rules from mozilla
* Builds the release .war file, using Maven with a OWASP Dependency-check plugin
* Sends data to SonarQube for analysis
* Copies the war file to a release directory
* Copies the war file to AWS S3
* Pushes the war file to the Cloud Foundry test instance
* Runs security acceptance tests (Test marked with @acceptance)
* Once acceptance tests have passed, the release is pushed to the test instance of Cloud Foundry
* Also after acceptance test, all other security tests run (experimental, unfinished stories, etc.)
```


Hourly:
```
* Runtime checks, which include SSL tests, nmap scans, HTTP method detection, etc.
```

Nightly (ToDo)
```
* A full ZAP dynamic scan
* Get project metrics from SonarQube, GitHub, etc. for monitoring and dashboarding
```

During Random Business Hours (ToDo)

```
* Attack simulations
```

TBD (ToDo)
```
* Automated auditing of services - AWS, GitHub, etc.
```

For Each Pull Requests

```
* Run a SonarQube scan and update the PR Comments
```

## Setup


### Prerequisites
It is necessary to have the following services available:
* SonarQube (I used a docker image which I configured) with several plugins enabled and configured
* Concourse server
* Amazon S3 account
* A Cloud Foundry account

### Setting env.yml file
Create a yml file with the following entries:

```bash
repo: ToddBenson/concourse-maven-spring-boot
git-repo: <Path to this repo>
git-repo-token: <A github token>
git-username: <Github username>
git-password: <Github Password>
git-security-tests: <URI to security test repo>
docker-image: <URI of the security test image>
sonar-token: <SonarQube Token>
sonar-java-binaries: <Path to class files, i.e. ./target/classes>
sonar-sources: <Path to source code, i.e. ./src/main/java/hello>
sonar-project-version: <SonarQube Project Version>
sonar-project-name: <SonarQube Project Name>
sonar-project-key: <SonarQube Project Key>
sonar-url: <SonarQube URI>
cf-da-password: <Cloud Foundry Password>
dev-hostname: <hostname of the development instance>
test-hostname: <hostname of the test instance>
s3-secret-access-key: <AWS S3 Access Key Secret>
s3-access-key-id: <AWS S3 Access Key ID>
github-private-key: <Github private key>
```


### Adding the Project to Concourse

```bash
$ fly -t <target> sp -p test-pipeline -c ci/pipeline.yml --load-vars-from <PATH to environment/credentials file>
$ fly -t <target> unpause-pipeline -p test-pipeline
```

## Resources

- <https://github.com/>
- <https://www.sonarqube.org/>
- <https://github.com/concourse/concourse>
- <https://maven.apache.org/>
- <https://projects.spring.io/spring-boot/>
- <https://aws.amazon.com/s3/>
- <https://pivotal.io/platform>
- <https://hub.docker.com/r/tgbenson/security-image/>
- <https://github.com/ToddBenson/cftest-security>




