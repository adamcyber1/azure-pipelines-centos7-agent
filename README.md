# Azure Pipeline Centos7 Agent

This is a custom Azure Pipelines agent built using docker and based upon the Centos7 image. 

[Link to Docker Hub](https://hub.docker.com/repository/docker/adamcyber/azure-pipelines-centos7-agent)

## Why?

Microsoft maintains a [set of virtual environments](https://github.com/actions/virtual-environments) for Github actions and Microsoft-hosted agents for Azure pipelines. 
As you can see, there is no Centos7 based agent. If you ever find yourself in a situation where you need your agent to run on CentOS - you will be sad.

## Who? 

Anyone who uses Azure Pipelines to run jobs where they require a specialized set of dependencies that includes CentOS.

## What? 

A Dockerfile and an entry in the docker repo

## How? 

The Azure Pipelines agent must be started with account connection information, provided through environment variables:

| Env Vatiable        | Description           | Example  |
| ------------- |:-------------| -----:|
| AZP_URL     | **required** Url to the Azure DevOps account | https://dev.azure.com/your-org |
| AZP_TOKEN     | **required** Azure DevOps user account personal access token (PAT) granting access to the AZP_URL     |   abcdefg |
| AZP_AGENT_NAME | **optional** Name of the agent. If not specified, the container's hostname is used    |  mydockeragent |
| AZP_POOL | **optional** Azure Pipelines agent pool name. If not specified, Default is used.   |  My Custom Agent Pool |
| AZP_WORK | **optional** Work directory. If not specified, _work is used.    |  _work |


Example:

docker run \
  -e AZP_URL=https://dev.azure.com/org \
  -e AZP_TOKEN=abcdefgh\
  -e AZP_AGENT_NAME=mydockeragent \
  azure-pipelines-centos7-agent:latest
Once the agent is running, it will appear in the list of agents in the specified DevOps pipeline agent pool.

## Acknowledgements

- https://github.com/actions/virtual-environments
- https://hub.docker.com/r/andrewconnell/azure-pipelines-linux-agent
- https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#adding-tools-and-customizing-the-container
