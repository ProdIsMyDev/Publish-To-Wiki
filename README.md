# Publish to Wiki on GitHub

This [Action][github actions] publishes the Wiki to your GitHub Wiki and generates a Sidebar by the Folder Structure.


## Usage

Add a Step 'ProdIsMyDev/Publish-To-Wiki@1' to your workflow.

```yml
name: Example_Wiki_Step

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v1
      - name: Publish to Wiki on GitHub
        uses: ProdIsMyDev/Publish-To-Wiki@1
        env:
          GH_PERSONAL_ACCESS_TOKEN: ${{ secrets.GH_PERSONAL_ACCESS_TOKEN }}
```

## Setup

This [Action][github actions] requires you to configure a secret called 'GH_PERSONAL_ACCESS_TOKEN' within your repository, containing a token with 'repo' rights.


## License

MIT

## Contact

Chris ([@ProdIsMyDev](https://twitter.com/ProdIsMyDev))

[github actions]: https://help.github.com/en/actions
