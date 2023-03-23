#!/usr/bin/env bash

echo "*******__ Fullstack Server API  __*******"

echo "*******__ 1.Create a repository with the eb init command.....👨🏻‍💻🤌🏻  __*******"
eb init aws-circle-ci-api --platform node.js --region us-east-1

cd .elasticbeanstalk
echo "deploy:
    artifact: build/Archive.zip" >> config.yml
cd ..

echo "*******__ 2.Create a sample with same name of the repository"
eb create --sample aws-circle-ci-api-dev

echo "******__ 3.Sets the specified environment....👨🏻‍💻🤌🏻  __*******"
eb use aws-circle-ci-api-dev

echo "*******__ 4.Deploy the changes....👨🏻‍💻🤌🏻  __*******"
eb deploy aws-circle-ci-api-dev

echo "*******__ 5.Set Env Variables....👨🏻‍💻🤌🏻  __*******"
eb setenv AWS_BUCKET=$AWS_BUCKET AWS_REGION=$AWS_REGION DB_PORT=$DB_PORT PORT=$PORT POSTGRES_DB=$POSTGRES_DB POSTGRES_HOST=$POSTGRES_HOST POSTGRES_PASSWORD=$POSTGRES_PASSWORD POSTGRES_USERNAME=$POSTGRES_USERNAME AWS_S3_ENDPOINT=$AWS_S3_ENDPOINT
