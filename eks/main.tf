module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "my-cluster"
  kubernetes_version = "1.29"

  addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
  }

  # Optional
  endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = var.vpc_var
  #security_group_ids       = aws_security_group.sg.id
  subnet_ids               = [var.subnet1_id, var.subnet2_id, var.subnet3_id]
  #control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]

  # EKS Managed Node Group(s)
    eks_managed_node_groups = {
    test_eks_node = {
      ami_type       = "AL2023_x86_64_STANDARD" # ✅ EKS 1.29 uses AL2023, not AL2
    instance_types = ["t3.micro"]
    min_size       = 1
    desired_size   = 1
    max_size       = 2
    capacity_type  = "ON_DEMAND"     
    }
  }


  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}