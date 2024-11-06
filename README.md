# Terraform job preparation
Questions and exercises for job preparation in terraform



### **A. Introduction to Terraform**

#### **Basic Questions:**

1. What is Terraform, and why is it used in the context of infrastructure automation?

2. Why should you use Terraform?

3. What do you mean by Infrastructure as Code (IaC)?

4. What are the key features of Terraform?

5. What is Terraform Cloud?

6. What are Terraform variables, and how can you use them?

7. What is Terraform’s `plan` command, and what is its purpose?

***

**Solution of Basic Question:**

- **1. What is Terraform, and why is it used in the context of infrastructure automation?**

  - When we work on an infrastructure (machines, servers, services), we need to be able to manage it (create, delete, update, add tools, etc.) as quickly as possible. 
  - It can also be really hard to manage all the elements in the infrastructure manually without making mistakes. This is where Terraform comes in and helps us to achieve these objectives.
  - __Terraform__ is an infrastructure as code (IaC) tool developed by HashiCorp that uses a declarative language to automate the provisioning, configuration and management of infrastructure resources in various environments.

***

- **2. Why should you use Terraform?**

  - There are several reasons for using Terraform, including :

    - **It's multi-cloud:** for companies that use several clouds (AWS cloud, AZURE , etc.), Terraform can be used since it's compatible with multiple cloud providers. 
    - **It’s Scalable:** at any time we can increase **(scale up)** or decrease **(scale down)**  the number of resources in our infrastructure by simply modifying the configuration files and then running the **apply** command.
    - **Version Control:** code written with terraform supports several version control tools (github, gitlab, bitbucket, ...)
***

- **3. What do you mean by Infrastructure as Code (IaC)?**
  - To answer this question, we would say that infrastructure is **seen as code**, as a program, similar to how software is developed. 
  - This will allow more __consistent__ and __repeatable__ deployment of resources (Server, Network, storage, ...).
  - Finally, the **manual resource creation process** will be replaced by an **automatic process managed** by an IaC.

***

- **4. What are the key features of Terraform?**

  - Terraform has a number of features that make it one of the most popular IaCs today. Our main features are : 
    - **Resource graph:** resource creation is based on a dependency graph. This makes it possible to create resources that have no parallel dependencies, thus improving infrastructure creation time.
    - **Modular Design:** terraform's module concept allows us to create modules, then call them up in various parts of our code. This is best practice, as it **reduces duplication**, and makes configurations more easy to reuse.
    - **Multi-Provider Support:** Compatible with numerous cloud providers (like AWS, Azure, Google Cloud) and on-premises solutions, allowing users to manage diverse infrastructures from a **single tool**.
    - **Remote Backends:** remote state storage options, enabling collaboration among team members and enhancing state management in team environments.

***

- **5. What is Terraform Cloud?**
  - __Terraform Cloud__ is the Terraform __SaaS__ feature that enables several people in a team to work on the same code. 
  - With terraform cloud, we see that the **state file** is stored in the cloud (S3 Bucket, S3 + MongoDB, Terraform Cloud, etc.), enabling collaborative work within the same source code.
  - Terraform Cloud integrates with **version control systems** (like GitHub, GitLab, and Bitbucket), enabling automated plans and applies based on pull requests or commits.
  - With terraform cloud, the state file is more secure, and can implement the __state locking__ mechanism
  - In summary, Terraform Cloud extends the capabilities of Terraform, making it easier for teams to **collaborate** on infrastructure projects while ensuring best practices in management, **compliance**, and **security**.

***

- **6. What are Terraform variables, and how can you use them?**
  - Terraform variables are a way to **parameterize** your Terraform configurations, allowing your code to be more **flexible** and **reusable**. 
  - We have several types of variables:
    - **Input Variables:** These are values that you define in your Terraform configuration that can be passed into the module or configuration from outside. 
    - **Output Variables:** These are used to extract information from your Terraform configurations after deployment. 
  - There are several ways to pass the value of a variable in a terraform code : 
    - **Command Line**: When running Terraform commands, you can use the `-var` flag to specify variable values:
      - __Exp :__ terraform apply -var="region=us-west-2"
    - **Variable Files**: You can create a `.tfvars` file (e.g., `terraform.tfvars`) to specify variable values 
      - __Exp :__ cat "region=us-west-2"> terraform.tfvars
      - The terraform.tfvars is created. You can call this file in the terminal like : ```terraform apply -var-file="terraform.tfvars"```

    - **Environment Variables** : Terraform allows you to set environment variables with a specific naming convention:
      - __Exp :__ export TF\_VAR\_region="us-west-2"

***

- **7. What's terraform plan command, and what is its purpose?**
  - The `terraform plan` command is a crucial part of the Terraform workflow. Its primary purpose is to generate an execution plan that outlines the changes Terraform will make to reach the desired state of your infrastructure as defined in your configuration files.
  - This process helps users to review changes carefully before applying them.

**Exercise 1 :** When you arrive at the company, a problem arises on one of the web servers that was created with HyperV __on-premise__. On this server was deployed the company's website. You are asked to set up a prototype of infrastructure that will host this server in the cloud. Propose this architecture using the knowledge discussed in this part.

**Educational objective:**
- Create the variables (input and output)
- Make an experimentation with the 3 ways of passing variables to the terraform code
- Discuss the infrastructure creation plan

***




#### **Intermediate Questions:**

***

- **8. What are the use cases of Terraform?**
  - Terraform has a wide range of use cases, from **resource management** (servers, storage, networks) to **cost optimization** in the cloud. In this case, we have :
    - **Infrastructure provisioning:** automating the creation and management of cloud resources, such as virtual machines, databases and network components.
    - **Environment management:** Create and manage multiple environments (development, test, production) with consistent configurations.
    - **Infrastructure versioning:** Track changes to infrastructure configurations using version control, enabling rollbacks and historical tracking.
    - **Cost management:** Optimize the use of cloud resources and monitor costs by automating the removal of unused resources.
    - **Compliance and security:** Ensure that infrastructure meets compliance standards by defining policies in code.
    - **Integration with CI/CD pipelines:** Automate infrastructure provisioning as part of continuous integration and delivery workflows.

***

- **9. How does Terraform differ from other infrastructure-as-code tools like CloudFormation or Ansible?**
  - **Terraform**, **CloudFormation** and **Ansible** are all infrastructure-as-code (IaC) tools. Each of these tools has its strengths, and the best choice often depends on your **specific use case** and **environment**. 
  - The following table presents some comparisons of these tools at several levels:

|                                             |                                                                                                                                                          |                                                                                                               |                                                                                                                                 |
| ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
|                                             | Terraform                                                                                                                                                | CloudFormation                                                                                                | Ansible                                                                                                                         |
| Provider Support                            | Supports multiple cloud providers (aws, azure, GCP, etc.) and on-premises solution, enabling multi-cloud management from a single configuration language | Specific to AWS, allowing users to manage only AWS resources                                                  | Manage cloud resources and on-premises servers, but it’s primarily a configuration management tool                              |
| Declarative, procedural and language syntax | **declarative** **approach**, uses the HashiCorp Configuration Language (HCL)                                                                            | **declarative** **approach**, Uses JSON and YAML                                                              | **Procedural**, Uses YAML for its playbooks, which is easy to read but focuses more on task execution than resource definition. |
| State Management                            | Maintains a state file that tracks the current state of your infrastructure, enabling it to understand changes and dependencies effectively.             | Manages state internally, but does not expose it to users. It handles changes through stacks and change sets. | Does not maintain state in the same way; it applies changes directly to the infrastructure based on the playbook.               |
| Community and Ecosystem                     | Has a large community and a wide array of modules and providers, making it easy to find reusable configurations.                                         | AWS-specific resources, with a strong focus on AWS services but less flexibility for other providers.         | Has a robust community, especially in configuration management and application deployment.                                      |
| Use Cases                                   | Best for managing infrastructure provisioning and lifecycle across multiple providers.                                                                   | Ideal for AWS-centric environments where users want deep integration with AWS services.                       | More suited for configuration management and application deployment, especially in hybrid environments.                         |
| Execution Model                             | Executes a plan before applying changes, allowing users to preview actions before they happen.                                                           | Updates are managed through stacks, but users cannot preview changes in the same way as Terraform’s plan.     | Executes tasks immediately as defined in the playbooks, without a separate planning phase.                                      |

***

- **10. How do you define dependencies in Terraform?**
  - In Terraform, dependencies are defined automatically by resource references, but when creating resources for complex infrastructures, we sometimes implement dependencies to give terraform an execution order. This implies the existence of __implicit dependencies__, __explicit dependencies__ and __dependencies between modules__ :
    - **Implicit Dependencies :** When a **resource references** another resource, Terraform automatically understands the dependency. 
      - **Example:** if a virtual machine references a security group, Terraform knows to create the security group first.

          ```
          resource "aws_security_group" "utrains_sg" {
            // Security group configuration
          }

          resource "aws_instance" "utrains_ec2" {
            ami       	= "ami-123456"
            instance_type = "t2.micro"

            security_groups = [aws_security_group.utrains_sg.name]
          }
          ```

    - **Explicit Dependencies** - `depends_on` **Argument**: You can explicitly define dependencies using the `depends_on` argument. This is useful when you want to enforce a specific order of creation that Terraform might not infer automatically.

        ```
        resource "aws_instance" "utrains_ec2" {
          ami       	= "ami-123456"
          instance_type = "t2.micro"

          depends_on = [aws_security_group.utrains_sg]
        }
        ```

- **Graph Visualization :** You can visualize dependencies using the terraform graph command, which generates a visual representation of your resource dependencies. This can help in understanding how resources are interconnected.
- By using resource references and the `depends_on` argument, Terraform effectively manages dependencies, ensuring that resources are created in the correct order. Understanding and managing these dependencies is crucial for creating a reliable and predictable infrastructure.

***

- **11. How does Terraform ensure the idempotency of resource provisioning?**
  - Through a combination of declarative configuration, state management, resource comparisons, and controlled execution phases, Terraform ensures that provisioning operations are idempotent. This means that applying the same configuration multiple times will yield the same result, preventing unintended changes or duplications in the infrastructure. Terraform ensures idempotency of resource provisioning through several mechanisms:
    - **Declarative Configuration:** Terraform uses a declarative approach, where you specify the desired state of your infrastructure in configuration files. Terraform then compares the current state with the desired state and makes only the necessary changes to achieve that state.
    - **State Management:** Terraform maintains a state file that reflects the current state of the infrastructure. This file is used to track **resource attributes, dependencies, and metadata**. When you run `terraform apply`, Terraform reads the state file, compares it to the desired configuration, and determines the actions required to reach the specified state.
    - **Resource Attributes Comparison:** Before **creating**, **updating**, or **deleting** resources, Terraform checks the existing attributes of each resource against the desired configuration. If the resource already matches the desired state, Terraform will not attempt to change it, thus ensuring idempotency.
    - **Plan and Apply Phases:** The `terraform plan` command creates an execution plan that shows the proposed changes without making any modifications. This allows users to review changes before applying them. If the current state matches the desired state, Terraform will report that no changes are necessary.
    - **Resource Lifecycle Management:** Terraform allows you to define resource lifecycle settings, such as `create_before_destroy` or `prevent_destroy`, which help manage how resources are created or modified. This adds an additional layer of control, contributing to idempotency.
    - **Error Handling:** If an error occurs during provisioning, Terraform will not leave the infrastructure in an inconsistent state. It will roll back changes if necessary, allowing the system to return to a stable state.

***

- **12. Describe the lifecycle of a Terraform resource.**
  - The lifecycle of a Terraform resource involves defining it, initializing the working environment, planning and applying changes, managing state, handling updates, and eventually destroying resources when needed. Lifecycle blocks add further control over how resources are created, updated, and destroyed, ensuring that infrastructure management is both efficient and safe. Here’s an overview of the key stages:
    - **Definition (Configuration):** Resources are defined in Terraform configuration files using the HashiCorp Configuration Language (HCL). This includes specifying the resource type, its properties, and any dependencies.
    - **Initialization (terraform init):** Before any operations, you run `terraform init` to initialize the working directory. This command downloads the necessary provider plugins and sets up the backend for state management.
    - **Planning (terraform plan):** Running `terraform plan` generates an execution plan by comparing the desired state (as defined in the configuration) with the current state (stored in the state file). It identifies actions needed to create, update, or delete resources.
    - **Application (terraform apply):** When you execute `terraform apply`, Terraform performs the actions outlined in the execution plan. This can include creating new resources, updating existing ones, or destroying those that are no longer needed. Terraform applies changes in the order of dependencies to ensure a correct state.
    - **State Management (state file):** After applying changes, Terraform updates the state file to reflect the current state of the infrastructure. This file is crucial for tracking resource attributes, relationships, and metadata.
    - **Updates (Resource Modification):** When the configuration is modified (e.g., changing resource properties), running `terraform apply` again will trigger an update process. Terraform calculates the necessary changes based on the updated configuration and current state.
    - **Destruction (terraform destroy):** If resources are no longer needed, you can run `terraform destroy` to remove them. This command will also update the state file accordingly. The destruction process considers dependencies to ensure a safe removal order.
    - **Lifecycle Blocks (Lifecycle Management):** You can define lifecycle settings within a resource block to control its behavior. Key settings include:
      - **create\_before\_destroy:** Ensures that a new resource is created before the old one is destroyed.
      - **prevent\_destroy:** Prevents accidental deletion of a resource.
      - **ignore\_changes:** Specifies attributes that should not trigger updates when their values change outside of Terraform.

* **13. How does Terraform handle secrets and sensitive data?**
  - **Managing secrets and sensitive data** is crucial for terraform to  ensure that they are handled securely throughout the lifecycle of infrastructure provisioning. Here are the key strategies:
    - **Sensitive Variables:** You can mark input variables as sensitive using the `sensitive` attribute in the variable definition. This prevents Terraform from displaying their values in the command line output or in the state file.

      ```
      variable "db_password" {
        type  	= string
        sensitive = true
      }
      ```
    - **Environment Variables :** Terraform can read sensitive data from environment variables. **This is particularly useful for credentials and secrets.** 
      - **Example**,you can set AWS  credentials as environment variables and reference them in your configuration.

      ```
      export AWS_ACCESS_KEY_ID="your_access_key_id"
      export AWS_SECRET_ACCESS_KEY="your_secret_access_key"
      export AWS_SESSION_TOKEN="your_session_token" # if using temporary credentials
      ```
    - **Terraform Vault Provider :** Integrating with HashiCorp Vault allows Terraform to retrieve secrets dynamically at runtime. This keeps sensitive data out of your Terraform configurations and state files.
    - **State File Security :** The state file contains information about your resources, including sensitive data. You can encrypt the state file when using a remote backend (like S3 with server-side encryption) to protect this information. For local state files, ensure that file permissions restrict access to authorized users only.
    - **Terraform Cloud and Enterprise:** Terraform Cloud and Terraform Enterprise provide **built-in secret management capabilities**. You can store sensitive variables securely and manage access control to them.

***

- **14. What is a null resource in Terraform?**
  - The __null resource__ is a flexible and powerful tool in Terraform, allowing you to execute scripts, manage dependencies, and perform actions that don't fit neatly into the model of managing traditional infrastructure. It enhances the capabilities of Terraform beyond pure resource provisioning.
    - **Provisioners**: You can attach provisioners (like `local-exec` or `remote-exec`) to a null resource to run scripts or commands. This can be useful for tasks like executing a script after a resource is created or configured.

      ```
      resource "null_resource" "example" {
        provisioner "local-exec" {
        command = "echo Hello, World!"
        }
      }
      ```
    - `remote-exec` can be used to run a script on a remote server, which will then install a set of tools.
    - Null Resource Caution: Null resources are best for tasks that cannot be managed directly with Terraform (e.g., custom scripts), but they should not be overused since they can complicate Terraform state management and debugging

***


#### **Advanced Questions:**
- **15. How does Terraform differ between the declarative and imperative approaches?**
  - Terraform is an infrastructure-as-code (IaC) tool that primarily follows a **declarative** approach, though it's essential to understand how this compares to the **imperative** approach, which is common in other programming paradigms and infrastructure management tools.
  - In the declarative approach, you define the **desired state** of your infrastructure, and Terraform takes care of creating, updating, or deleting resources to achieve that state. You describe **what** the final configuration should look like, rather than the specific steps to get there.

|                      |                                                                       |                                                        |
| :------------------: | :-------------------------------------------------------------------: | :----------------------------------------------------: |
|      **Aspect**      |                      **Declarative (Terraform)**                      |             **Imperative (Scripts/Tools)**             |
|       **Focus**      |                    Define the **desired end state**                   |   Define the **sequence of steps** to achieve a goal   |
|     **Execution**    |                Terraform computes the necessary changes               |     User must specify the exact sequence of actions    |
| **State Management** |                   Managed by Terraform (state file)                   |    No inherent state tracking, must handle manually    |
|    **Idempotence**   | Ensures that multiple runs lead to the same result if nothing changes | Each command runs every time, manual management needed |
|    **Complexity**    |                    Simplifies complex environments                    |    More complex to manage large or evolving systems    |
|    **Ease of Use**   |                      Easier to use for most tasks                     |        Can be more complex due to manual control       |


### **Summary:**

Terraform's **declarative** approach makes it easier to manage infrastructure at scale because you focus on what the final environment should look like, rather than the steps to get there. It handles complexity by automatically determining the order of operations, maintaining state, and ensuring idempotence. The **imperative** approach, while more manual, provides explicit control over each step of the process but requires more effort and is prone to errors in larger, more complex environments.

***

- **16. What are some advanced use cases of Terraform, such as blue-green deployments or immutable infrastructure?**
  - Terraform is highly versatile and can be used for various advanced infrastructure management use cases, including blue-green deployments, immutable infrastructure, and more. Here are some **advanced use cases of Terraform** that leverage its capabilities to handle complex infrastructure needs : 
    - **Blue-Green Deployments:** are a deployment strategy that helps reduce downtime and risk by running two identical environments (blue and green). One environment (let’s say blue) is live, while the other (green) is idle. The new version of the application is deployed to the idle environment (green), and after testing, traffic is switched from blue to green. If something goes wrong, the traffic can easily be reverted back.
    - **Terraform Implementation:**
      - **Environment Duplication:** Terraform can be used to automate the provisioning of two identical environments, blue and green.
      - **Traffic Shifting:** Terraform can manage load balancers (e.g., AWS ALB, Google Cloud Load Balancer) to shift traffic between blue and green environments. By using **Terraform's** 
      - **resource dependency graph** and orchestration capabilities, traffic can smoothly transition without service interruption.

**Steps:**
1. Use Terraform to provision both environments (blue and green), ensuring that the same infrastructure is replicated.
2. Deploy the new version of the application to the idle (green) environment.
3. Use Terraform to update the load balancer to point traffic from blue to green.
4. After validation, the green environment becomes live.
5. If needed, you can roll back to blue by reversing the load balancer changes.

```
resource "aws_lb" "example_lb" {
  name           	= "example-lb"
  internal       	= false
  load_balancer_type = "application"
}

resource "aws_lb_listener" "example_listener" {
  load_balancer_arn = aws_lb.example_lb.arn
  port          	= "80"
  protocol      	= "HTTP"
 
  default_action {
	type         	= "forward"
	target_group_arn = aws_lb_target_group.blue.arn
  }
}

resource "aws_lb_target_group" "blue" {
  name 	= "blue-target-group"
  port 	= 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "green" {
  name 	= "green-target-group"
  port 	= 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
```
***

- **17. How does Terraform handle remote state management across multiple environments?**

  - Terraform handles **remote state management** across multiple environments by using **state files** stored in a centralized location. These state files keep track of the infrastructure that has been provisioned, ensuring that Terraform can understand the current state of resources when changes are made. Managing state remotely, rather than locally, is critical in multi-environment setups (e.g., dev, staging, production) to maintain consistency, avoid conflicts, and enable collaboration across teams.

  - Here’s how Terraform handles remote state management across multiple environments:

    - **Remote State Storage :** By default, Terraform stores state files locally on the machine where Terraform runs. However, for multiple environments and team collaboration, storing the state remotely is a more scalable and reliable solution. Terraform supports storing state remotely in several backend storage solutions, such as:

      - **Amazon S3** (for AWS)

      - **Azure Blob Storage** (for Azure)

      - **Google Cloud Storage** (GCS)

      - **HashiCorp Terraform Cloud/Enterprise**

      - **Consul**

      - **Etcd**

**Configuring Remote State in AWS S3 :** 

```
terraform {
  backend "s3" {
	bucket = "my-terraform-state-bucket"
	key	= "prod/terraform.tfstate"
	region = "us-west-2"
	dynamodb_table = "terraform-state-lock"  # Optional: For state locking
	encrypt = true
  }
}
```


- **Environment Segregation (Workspaces, Key-based Segmentation):** Terraform allows managing multiple environments (e.g., dev, staging, prod) by segregating state files either through workspaces or by organizing state files in separate paths using different keys within the backend.

  - **Workspaces**:Terraform workspaces provide an easy way to manage different environments (or configurations) in the same project by allowing each workspace to have its own state file. This is especially useful when you want to reuse the same infrastructure code across different environments without duplicating it.

  - **Default Workspace:** Every Terraform project starts in the `default` workspace.

  - **Additional Workspaces:** You can create additional workspaces (e.g., `dev`, `staging`, `prod`) and switch between them.

  - **Example:** Managing Multiple Environments with Workspaces

|                                                                                                                                                                                                                |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| # Create a new workspace for staging terraform workspace new staging # Switch to the staging workspace terraform workspace select staging # Apply the configuration to the staging environment terraform apply |

Each workspace will have its own state, so `terraform.tfstate` files will be segregated by workspace. This allows the same Terraform codebase to manage different environments.

***

- **18. How can Terraform be used with infrastructure orchestration tools like Kubernetes or Docker Swarm?**

  - Terraform can be effectively used in combination with infrastructure orchestration tools like Kubernetes and Docker Swarm to automate the provisioning and management of containerized infrastructure. Terraform’s flexibility and provider-agnostic nature make it a powerful tool for creating and maintaining the underlying infrastructure for container orchestration platforms, as well as interacting with the orchestration platforms themselves to manage resources.

  - Terraform can be integrated with Kubernetes in two primary ways:

    - Provisioning the Kubernetes Cluster Infrastructure: Terraform can automate the setup of the infrastructure required to run a Kubernetes cluster (e.g., EC2 instances, EKS, GKE, AKS, networking, etc.).

    -  Managing Kubernetes Resources: Terraform can interact with the Kubernetes API directly to manage resources like namespaces, deployments, services, and config maps once the cluster is operational.

      - Terraform can be used to provision Kubernetes clusters on popular cloud providers, such as:

        -  Amazon EKS (Elastic Kubernetes Service)

        - Google GKE (Google Kubernetes Engine)    

        - Azure AKS (Azure Kubernetes Service)

        - Terraform providers for each cloud platform simplify the setup by abstracting away the manual processes for creating the underlying infrastructure (e.g., VPCs, subnets, networking, and node pools).

        -

**Exercice: Provisioning an EKS Cluster on AWS using terraform**

