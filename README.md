Development tools for Giant
===========================

[Web](http://giantjs.org) [Npm](https://www.npmjs.com/~giantjs) [GitHub](https://github.com/giantjs)

**WARNING**: Giant is in a state of flux. Expect frequent breaking changes.

This repo is for contributing to Giant. If you want to use Giant in your app, see [https://www.npmjs.com/package/giant](https://www.npmjs.com/package/giant).

Installation
------------

### Giant Development CLI

Running the following command from the project root will give you the CLI `giant-dev` through which you can run (batch) commands for one or more modules.

    npm install -g
   
### Karma

It advised to install Karma if you don't have it already.

    npm install -g karma

CLI Usage
---------

The CLI takes two arguments.

1. Which argument to run the command for.
2. Command to be run for each affected module.

### Example

Lists the working directories for all Giant modules.

    giant-dev all pwd

### Deployment

These batch commands help you get through a full deployment. (After having set the new version for all modules.)

    giant-dev all "npm install"
    giant-dev all "git tag v#.#.#"
    giant-dev all "grunt build"
    giant-dev all "npm publish"

### Other useful commands

    giant-dev all "npm prune"
    giant-dev all "git tag -d v#.#.#"
    giant-dev all "git reset --hard HEAD~1"
