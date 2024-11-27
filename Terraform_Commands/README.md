### **4. Terraform Commands**

#### **A- Basic Questions:**

**1- What are the most useful Terraform commands?**

- Terraform offers a variety of commands that are essential for managing infrastructure as code effectively. Here’s a list of some of the most useful Terraform commands, along with brief descriptions of their functionality:


### **1. terraform init**

- **Purpose**: Initializes a new or existing Terraform working directory.

- **Usage**: Downloads provider plugins and initializes the backend.

- **Example**:

|                |
| -------------- |
| terraform init |


### **2. terraform plan**

- **Purpose**: Creates an execution plan, showing what actions Terraform will take to reach the desired state defined in the configuration files.

- **Usage**: It’s a preview of what will happen when you run `terraform apply`.

- **Example**:

|                |
| -------------- |
| terraform plan |


### **3. terraform apply**

- **Purpose**: Applies the changes required to reach the desired state of the configuration.

- **Usage**: This command makes actual changes to your infrastructure based on the execution plan.

- **Example**:

|                 |
| --------------- |
| terraform apply |


### **4. terraform destroy**

- **Purpose**: Destroys the Terraform-managed infrastructure.

- **Usage**: This command removes all resources defined in the Terraform configuration.

- **Example**:

|                   |
| ----------------- |
| terraform destroy |


### **5. terraform fmt**

- **Purpose**: Formats Terraform configuration files to a canonical format and style.

- **Usage**: It ensures that your code adheres to Terraform's style conventions, making it easier to read and maintain.

- **Example**:

|               |
| ------------- |
| terraform fmt |


### **6. terraform validate**

- **Purpose**: Validates the Terraform configuration files for syntax correctness and internal consistency.

- **Usage**: This command checks for errors in the configuration files before applying changes.

- **Example**:

|                    |
| ------------------ |
| terraform validate |


### **7. terraform show**

- **Purpose**: Displays the current state or the results of a plan in a human-readable format.

- **Usage**: Useful for reviewing the current state or outputs after applying changes.

- **Example**:

|                |
| -------------- |
| terraform show |


### **8. terraform output**

- **Purpose**: Retrieves the output variables defined in the Terraform configuration.

- **Usage**: This command is helpful for extracting useful information after applying changes.

- **Example**:

|                  |
| ---------------- |
| terraform output |


### **9. terraform refresh**

- **Purpose**: Updates the state file with the latest information from the real infrastructure.

- **Usage**: Useful for syncing the state file with the actual state of resources, especially after manual changes outside of Terraform.

- **Example**:

|                   |
| ----------------- |
| terraform refresh |


### **10. terraform state**

- **Purpose**: Advanced command for managing the Terraform state file.

- **Usage**: Includes subcommands for listing resources, moving resources, and removing items from the state file.

- **Example**:

|                      |
| -------------------- |
| terraform state list |


### **11. terraform workspace**

- **Purpose**: Manages different workspaces (environments) within a single Terraform configuration.

- **Usage**: Allows you to create, select, and delete workspaces.

- **Example**:

|                                                            |
| ---------------------------------------------------------- |
| terraform workspace new dev terraform workspace select dev |


### **12. terraform providers**

- **Purpose**: Displays information about the providers required by the configuration.

- **Usage**: Useful for understanding which providers your configuration is using and their versions.

- **Example**:

|                     |
| ------------------- |
| terraform providers |


### **13. terraform import**

- **Purpose**: Imports existing infrastructure into Terraform's management.

- **Usage**: This command allows you to bring pre-existing resources under Terraform's control without recreating them.

- **Example**:

|                                                            |
| ---------------------------------------------------------- |
| terraform import aws\_instance.example i-1234567890abcdef0 |

***

**2- How do you check the installed version of Terraform?**

|                                      |
| ------------------------------------ |
| terraform version terraform -version |

***

**3- What is the** `terraform init` **command used for?**

- The `terraform init` command is essential for preparing a Terraform working directory for managing infrastructure. It downloads provider plugins, configures the backend for state management, and sets the stage for subsequent Terraform operations. Running this command ensures that your environment is correctly set up to start defining and deploying infrastructure as code.

***


#### **B- Intermediate Questions:**

**4- How do you upgrade plugins in Terraform?**

- Upgrading plugins in Terraform, which include provider plugins and modules, is an important task to ensure that you have access to the latest features, bug fixes, and improvements. Here’s how to upgrade plugins in Terraform effectively:

  -  **1. Upgrade Provider Plugins**

    - #### **a. Modify the Required Version**

    - The first step to upgrading provider plugins is to specify the desired version in your Terraform configuration file, typically `main.tf`, under the `terraform` block.

|                                                                                                                                            |
| ------------------------------------------------------------------------------------------------------------------------------------------ |
| terraform {   required\_providers { aws = {   source  = "hashicorp/aws"   version = "\~> 4.0"  # Upgrade to the latest 4.x version }   } } |

- #### **b. Run** `terraform init -upgrade`

- After modifying the required version, run the following command to upgrade the provider plugins:

|                         |
| ----------------------- |
| terraform init -upgrade |

- This command performs several actions:

  - It updates the provider plugins to the latest version that matches the specified constraints.

  - It also ensures that any new providers specified in the configuration are downloaded and installed.

***

**5- What is the** `terraform apply` **command, and how does it differ from** `terraform plan`**?**

You’ll see a summary of the proposed changes, such as resources to be added or removed.

|               |                                                   |                                                      |   |   |   |   |   |   |   |
|---------------|---------------------------------------------------|------------------------------------------------------|---|---|---|---|---|---|---|
|               |                                                   |                                                      |   |   |   |   |   |   |   |
|               |                                                   |                                                      |   |   |   |   |   |   |   |
| Feature       | terraform apply                                   | terraform plan                                       |   |   |   |   |   |   |   |
| Purpose       | Applies changes to the infrastructure             | Generates an execution plan without applying changes |   |   |   |   |   |   |   |
| State Changes | Updates the state file to reflect applied changes | Does not modify the state file                       |   |   |   |   |   |   |   |
| Confirmation  | Prompts for confirmation before making changes    | No confirmation; it only shows proposed changes      |   |   |   |   |   |   |   |
| Output        | Displays the result of the applied changes        | Displays what changes will be made                   |   |   |   |   |   |   |   |
|               |                                                   |                                                      |   |   |   |   |   |   |   |
|               |                                                   |                                                      |   |   |   |   |   |   |   |


### **Key Differences Between** `terraform apply` **and** `terraform plan`



- ### In summary, the `terraform apply` command is used to make changes to your infrastructure based on your configuration files, while `terraform plan` is used to preview those changes without executing them. It is common practice to run `terraform plan` first to review the proposed changes, and then run `terraform apply` to implement those changes confidently. This two-step process helps prevent unintended modifications and ensures greater control over your infrastructure management.

***


#### **C- Advanced Questions:**

**6- Which command can be used to reconcile the Terraform state with the actual infrastructure?**

- To reconcile the Terraform state with the actual infrastructure, you can use the `terraform refresh` command.


### **What is** `terraform refresh`**?**

1. **Purpose**: The `terraform refresh` command updates the Terraform state file with the current state of the infrastructure. It retrieves the actual state of the resources from the provider APIs and modifies the state file accordingly.

2. **When to Use**: This command is useful in scenarios where changes have been made to the infrastructure outside of Terraform (e.g., manual changes in the cloud provider's console or through other tools). Running `terraform refresh` ensures that the state file accurately reflects the current state of the resources.

3. **Execution**:

   - When you run `terraform refresh`, Terraform will query each resource defined in your configuration and update the corresponding state in the state file. This process can identify any discrepancies between the managed state and the actual infrastructure.


### **Example Usage of** `terraform refresh`

To reconcile the state, you would run:

|                   |
| ----------------- |
| terraform refresh |



***

**7- How do you recover from a failed apply in Terraform?**

- Recovering from a failed `terraform apply` involves understanding the cause of the failure, assessing the current state of your infrastructure, and taking corrective actions—whether that be manual cleanup, configuration changes, or reapplying changes. By following the steps above, you can navigate the recovery process effectively and restore your infrastructure to a stable state.

***

**8- What is Terraform’s** `destroy` **command, and how is it used?**

The `terraform destroy` command is a powerful command in Terraform that is used to delete all the resources defined in your Terraform configuration files. This command is typically used to clean up the infrastructure that was provisioned by Terraform, either to free up resources or to reset the environment. Here’s a detailed look at how `terraform destroy` works and how to use it effectively.


### **What is** `terraform destroy`**?**

1. **Purpose**: The primary purpose of the `terraform destroy` command is to remove all infrastructure components that Terraform manages. This includes all resources defined in the `.tf` files within the current working directory.

2. **State File Interaction**: When you run `terraform destroy`, Terraform will reference the state file to identify which resources it has created and managed. It then constructs a plan to delete each of these resources.

3. **No Recovery**: Once resources are destroyed, they cannot be recovered through Terraform. It is crucial to ensure that you really want to delete these resources before proceeding.
