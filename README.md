# Steps to configure CircleCI with AWS S3, RDS and Elastic Beanstalk

## CIRCLE CI

1. Create Circle CI Project
2. Setup Environment Variables

## AWS

-   Create IAM user with `AdministratorAccess`

-   Configure the aws cli user with your terminal via `aws configure`

### Create S3 Bucket

-   open terminal and run the following to create s3 bucket

```bash
aws s3api create-bucket \
           --bucket abozaid-bucket-1 \
           --region us-east-1
```

-   Set Bucket Policy for S3 Bucket

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": ["s3:GetObject"],
            "Resource": ["arn:aws:s3:::abozaid-bucket-1/*"]
        }
    ]
}
```

-   in s3 bucket properties go to static website hosing and enable it as below image and save the changes

-   you should have a url for example `http://abozaid-bucket-1.s3-website-us-east-1.amazonaws.com/`

-   now it's time to upload you static files and this can be by

```bash
aws s3 sync build/ s3://abozaid-bucket-1
```

```bash
aws s3 rb s3://abozaid-bucket-1 --force
```
