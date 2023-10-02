# Infrastructure as Code
IIK3005 - Infrastructure as Code. Terraform projects for setting up infrastructure on Azure. Provisioning and managing of resources through code. 

## Projects
Each folder contains a different project. A short description of each project is given below.

- **backend** - This project will work as a backend for the other projects. The backend project will provision and manage a storage account and a container which will hold all tfstate files for the other projects. The other projects will use the backend project as a remote backend.
