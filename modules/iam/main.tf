resource "aws_iam_role" "ec2_role" {
  name = "${var.name_prefix}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
  tags = var.tags
}

# build policy to allow GetObject/PutObject and ListBucket on the S3 bucket created
locals {
  s3_bucket_arn      = var.bucket_arn != "" ? var.bucket_arn : "arn:aws:s3:::${var.bucket_name}"
  s3_bucket_objects  = "${local.s3_bucket_arn}/*"
}

resource "aws_iam_policy" "s3_policy" {
  name        = "${var.name_prefix}-s3-policy"
  description = "Allow EC2 to Get/Put objects in specified S3 bucket"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          local.s3_bucket_arn,
          local.s3_bucket_objects
        ]
      }
    ]
  })
  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.name_prefix}-instance-profile"
  role = aws_iam_role.ec2_role.name
  tags = var.tags
}
resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.name_prefix}-iam-instance-profile"
  role = aws_iam_role.ec2_role.name
  tags = var.tags
}

