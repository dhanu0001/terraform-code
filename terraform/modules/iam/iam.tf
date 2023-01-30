resource "aws_iam_policy" "ssm_policy1" {
  name        = "${var.project}-ssm-policy1"
  path        = "/"
  description = "Access to Parameter Store variables"
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "ssm:GetParameters"
        ],
        "Resource": "*"
      }
    ]
  })
}

resource "aws_iam_policy" "logs_policy1" {
  name        = "${var.project}-logs-policy1"
  path        = "/"
  description = "Access to Cloudwatch"
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams"
        ],
        "Resource": [
          "arn:aws:logs:*"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "ecr_policy1" {
  name        = "${var.project}-ecr-policy1"
  path        = "/"
  description = "Access to ECR"
  policy      = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetAuthorizationToken"
        ],
        "Resource": "*"
      }
    ]
  })
}

data "aws_iam_policy_document" "ecs_tasks_execution_role1" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "backstage_role" {
  name               = "${var.project}-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_tasks_execution_role1.json
}

resource "aws_iam_role_policy_attachment" "backstage-ssm-policy1-attach" {
  role       = aws_iam_role.backstage_role.name
  policy_arn = aws_iam_policy.ssm_policy1.arn
}

resource "aws_iam_role_policy_attachment" "backstage-logs-policy1-attach" {
  role       = aws_iam_role.backstage_role.name
  policy_arn = aws_iam_policy.logs_policy1.arn
}

resource "aws_iam_role_policy_attachment" "backstage-ecr-policy1-attach" {
  role       = aws_iam_role.backstage_role.name
  policy_arn = aws_iam_policy.ecr_policy1.arn
}