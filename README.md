# Terraform-EKS-Architecture
Builds off of the prior terraform projects I've created with the 3-tier VPC and Bastion Host. This goes further to implement AWS' own managed Kubernetes as a service, called EKS, including the control plane and node group.

This project, without doubt has to be one of the most challenging. Setting up EKS on AWS is no small task. A lot of the reference docs would be needed here. If you check the docummentaion weebsite, a link is usually labelled "PDF" after the heading. Clicking on this will take you to the full 500 page documentation referenced for EKS Setup. 

I'm not joking. Its 500 pages. 

Just simply knowing the right roles to attach to the entire EKS Cluster in order to interact with other AWS service, as well ass the role needed by the node group, is throrough work. And those roles might just be generic. Fine tuning it for organisational requirements would be something that would be quite interesting. At least to me

Please note, that I haven't shown the ENI's (Elastic Network Interface) that the control plane uses to configure networking with the node group(s). An elastic network interface is automatically attached to the subnets that you specify in Terraform resource block 'aws_eks_cluser' for the 'vpc_config' attribute.

The connections on the EKS node group will be done via the Bastion host, as expected. To acces AWS services via the terminal, the terraform provisionerrs will come to play here, using the .pem file you would have donwloaded from the IAM User console. 

Kubectl commands can be run once you SSH-ed into the node groups to test whether or not it is running.


![EKS](EKS (1).svg)
