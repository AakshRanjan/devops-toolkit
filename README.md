# devops-toolkit

This will repository contains all the elements needed to start a CI/CD pipeline.

Current Issue to Fix:
    - Running the start_jenkins.sh script from ansible fails.
        Error: /root/workspace/devops-toolkit/jenkins/scripts/docker/clean_up.sh: No such file
        Thoughs: $HOME is return "/root", not "/home/ubuntu"
        Fix: Ansible is running as root user, therefore $HOME is returning "/root"