resource "aws_s3_bucket" "s3_bucket" {
    bucket = "terra-bucket--secure-states"

    tags = {
        Name = "terra-bucket--secure-state"
        Environment = "prd"
    }
}