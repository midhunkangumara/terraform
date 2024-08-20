
# 🚀 Terraform Basics

Welcome to my Terraform learning journey! This repository contains my notes, Terraform configuration files, and key concepts as I progress through mastering Terraform. Below you'll find an introduction to the basics of Terraform, along with examples and essential commands.

## Introduction

This repository is dedicated to my exploration of Terraform, an open-source tool by HashiCorp that allows you to define, provision, and manage infrastructure as code. In this stage, I’m focusing on understanding the fundamentals, such as how to write basic configurations and use essential Terraform commands.

## Terraform Configuration Files

Terraform configurations are written in `.tf` files. These files define the resources you want to create and manage in your infrastructure. Here are the key types of Terraform files you'll find in this repository:

### Key Files
- **`main.tf`:** The main configuration file where infrastructure resources are defined, such as virtual machines, networks, and storage.
- **`variables.tf`:** A file to define input variables, making configurations more flexible and reusable. Variables allow you to input values without hardcoding them into your configuration.
- **`outputs.tf`:** Defines output values that Terraform should return after running. Outputs are useful for exposing key information, such as resource IDs or IP addresses.

### Example: Basic AWS EC2 Instance

Below is an example configuration that creates an AWS EC2 instance. This example is included in the repository under `main.tf`:

```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

- The `provider` block specifies AWS as the cloud provider and sets the region.
- The `resource` block defines an EC2 instance with a specific Amazon Machine Image (AMI) and instance type.

## Essential Terraform Commands

Terraform’s command-line interface (CLI) is where you interact with your configurations. Below are some of the essential commands that I’ve learned to use:

- **`terraform init`:** Initializes the working directory containing the Terraform configuration files. This command downloads necessary provider plugins and sets up the environment.
- **`terraform plan`:** Creates an execution plan, showing what actions Terraform will take to reach the desired state defined in your configuration. It’s like a dry run to check for errors before making any changes.
- **`terraform apply`:** Applies the changes required to reach the desired state of the configuration. This command will prompt you to confirm before making any changes.
- **`terraform destroy`:** Destroys the infrastructure managed by Terraform. This command is useful for tearing down environments when they’re no longer needed.

## Deploying My First Resource

Using the commands listed above, I successfully deployed my first AWS EC2 instance. The process was smooth, and it was exciting to see infrastructure come to life from just a few lines of code.

## Next Steps

I’m eager to continue learning more advanced Terraform features, such as modules, state management, and remote state backends. Stay tuned for more updates as I continue this journey!

## Resources

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform Installation Guide](https://developer.hashicorp.com/terraform/install)

## Connect with Me

Feel free to reach out or contribute to this repository if you have suggestions, questions, or want to share your own Terraform experiences!
