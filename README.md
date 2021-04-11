# React App with CircleCI and aws ECR hosting

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

CI/CD is implemented using CircleCI. 

[CircleCI config file](https://github.com/mushthak/react-circleci-sample/blob/main/.circleci/config.yml)

## CircleCI jobs

Jobs and actions specified in CircleCI

### `test`

Which creates a node docker image, checks out code, install dependencies and run the tests.

### `aws-ecr/build-and-push-image`

Once test is success run aws orb command which build docker image based on definition in [DockerFile](https://github.com/mushthak/react-circleci-sample/blob/main/Dockerfile) and upload to aws ECR private repository

### `aws-ecs/deploy-service-update`

Once test is success aws orb command builds a docker image based on definition in [DockerFile](https://github.com/mushthak/react-circleci-sample/blob/main/Dockerfile) and upload to aws ECR private repository

## CircleCI Environment Variables

<img width="1440" alt="Screen Shot 2021-04-11 at 9 07 31 PM" src="https://user-images.githubusercontent.com/11793859/114310892-13da8b80-9b0a-11eb-8c87-92d87ca1109c.png">

## References

- [Deploying React Docker Image to AWS Fargate](https://medium.com/@daniel.revie1/deploying-react-docker-image-to-aws-fargate-bf551128cb88)
