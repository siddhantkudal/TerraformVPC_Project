terraform {
    backend "s3" {
        bucket = "siddhant-s3-demo-sksks"
        region = "us-east-1"
        key = "siddhant/terraform.tfstate"

    }


}