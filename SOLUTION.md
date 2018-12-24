The webserver is a golang application using echo webserver framework.
This application has 2 endpoints:
- `/` showing a hello world message
- `/version` showing version number and and hash of the last commit

The tool for the CI pipeline is travisci as it is free for open source projects and it has its pipeline defined in .travis.yml file

On build time we create an Amazon image as an artifact of the code. We use this approach to make sure we are deploying exactly the same code that is tested in the CI, and also with this approach we can achive immutable deployment.
We use Hashicorp Packer for this, as it lets us create this image with a simple json file.

For infra as code, we use Hashicorp Terraform. This lets us define all the infra as code, Terraform will resolve for us the dependencies between resources. Also, terraform stores the state of the resources it manages and we can update the resources we are managing

For infra, important decission note: I am using default VPC and Subnet to simplify the solution.
For the application the infra chosen was using and AutoScaling Group, which lets us asign an Amazon image and scale in an out instances from that image. An ALB is attached to this autoscaling group, always balacing the traffic between all the instances from the ASG. Scaling in new instances with the new version code, and the later removing the old one lets us make zero downtime deployments.

For creating the infra, `terraform plan` first to check the changes that are going to be applied and the `terraform apply`
Terraform recipe already looks up for the newest Amazon image available, so building a new one will attach the new image to the ASG
