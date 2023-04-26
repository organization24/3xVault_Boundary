terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [
        aws.dr_provider,
        aws.hq_provider,
        aws.pr_provider,
      ]
    }
  }
}