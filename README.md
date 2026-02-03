# Lab 8: Automated Testing with Jenkins & Robot Framework

This repository contains the source code and configuration for **Lab 8**, focusing on setting up a CI/CD pipeline using **Jenkins** to run automated tests with **Robot Framework** and **Selenium Library** inside a Docker container.

## 📂 Project Structure
├── Lab8_5/
│   └── Dockerfile          # Custom Jenkins image with Chromium & Robot Framework installed
├── tests/
│   └── Lab8.robot          # Robot Framework test script
├── Lab8_Worksheet.pdf      # Lab documentation
├── Lab8_Worksheet.docx      # Lab documentation
└── README.md               # Project documentation
🚀 Prerequisites
Docker Desktop installed on your machine.

Git installed.

🛠️ Setup & Installation
Since this project requires specific browser drivers (Chromium) to run on Docker (especially for ARM64/Mac M1/M2 architecture), we need to build a custom Docker image.

1. Build the Docker Image
Open your terminal at the root of this repository and run:

Bash
# Build the image from the Dockerfile inside Lab8_5 folder
docker build -t jenkins-robot-local ./Lab8_5
2. Run the Jenkins Container
Run the following command to start the Jenkins container with Robot Framework support:

Bash
docker run -d --name jenkins-robot \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  --env JAVA_OPTS="-Dhudson.model.DirectoryBrowserSupport.CSP=" \
  jenkins-robot-local
Note: The JAVA_OPTS flag is added to allow viewing Robot Framework HTML reports directly in Jenkins.

3. Access Jenkins
Open your browser and go to: http://localhost:8080

Unlock Jenkins using the initial admin password (found in the container logs or /var/jenkins_home/secrets/initialAdminPassword).

⚙️ Jenkins Job Configuration
To run the tests in this repository, create a Freestyle Project in Jenkins with the following settings:

Source Code Management:

Git Repository URL: https://github.com/kriangkraiii/jenkins-robot-lab.git

Branch: */main

Build Steps (Execute Shell):

Bash
echo "Running Robot Framework tests..."
mkdir -p results
robot -d results tests/
Post-build Actions:

Publish Robot Framework test results

Directory of Robot output: results

Thresholds: Pass: 80% / Unstable: 20%

🧪 About the Tests
The test script is located in tests/Lab8.robot. It performs the following actions:

Opens a Headless Browser: Uses Chromium (configured for Docker environment).

Navigates to: College of Computing, KKU.

Captures Screenshot: Saves a screenshot of the homepage for verification.

👨‍💻 Author
Kriangkrai - Computer Science, Khon Kaen University
