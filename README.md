# IPA Toolkit <br> <small>backend</small>

The IPA Toolkit implements helpful tools to master the mighty IPA process. This is the backend application which provides a GraphQL API.

## Getting started

1. Make sure that you have a working [Visual Studio Code with Remote Containers](https://code.visualstudio.com/docs/remote/containers#_getting-started) configured.
1. Create a Docker network `ipa-toolkit-network` <br> `docker network create ipa-toolkit-network`
1. Open the project in Visual Studio Code using Remote Containers.
1. Don't forget to set your Git name and email <br> `git config user.name <name>` and `git config user.email <email>`
1. Run the server <br> `rails s`