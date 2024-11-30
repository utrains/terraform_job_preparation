# Exercise 2: Setting Up a CI/CD Pipeline for Terraform with GitHub Actions

__Objective:__
The goal of this exercise is to create a CI/CD pipeline for automating the deployment and management of infrastructure using Terraform. This pipeline will be implemented using GitHub Actions, which automates tasks such as validating, formatting, planning, and applying Terraform configurations.

__Note:__ For the application of this exercise, you can use the repository from your Exercise 1 or another Terraform repository of your choice.

__Solution description Steps:__

  __Create a GitHub Repository__
    Ensure you have a GitHub repository where your Terraform code is stored.

    Set Up GitHub Actions Workflow
    In your repository, create a .github/workflows/terraform-ci-cd.yml file. This file will define the pipeline to automate your Terraform tasks.

  __Define the CI/CD Pipeline__
    The pipeline should include the following stages:
    __Terraform Init:__ Initialize Terraform to set up the backend and download necessary plugins.
    __Terraform Format Check:__ Ensure the Terraform code is correctly formatted.
    __Terraform Validation:__ Validate the Terraform code to ensure it is syntactically and logically correct.
    __Terraform Plan:__ Generate an execution plan to review what changes Terraform will apply.
    __Terraform Apply:__ Apply the changes to the infrastructure (only on the main branch).
