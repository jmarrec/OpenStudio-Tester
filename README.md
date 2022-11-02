# Tester for OpenStudio SDK

Tests a given [NREL/OpenStudio](https://github.com/NREL/OpenStudio) installer on:

* A **clean** docker `ubuntu:focal`
* The Github-Hosted action runners for `macos-latest` and `windows-latest`
    * **Caveat**: these have a lot of developer tools already installed, so we might be missing some issues...


TODO:

* Implement a `repository_dispatch` event
* Move it to NREL/OpenStudio, and have Jenkins POST the `repository_dispatch` event with the payload


## Triggering the workflow_dispatch from the terminal

### Using gh CLI (authenticated already)

```shell
gh workflow -R jmarrec/OpenStudio-Tester run test_repo_dispatch.yml \
    -f base_url=http://openstudio-ci-builds.s3-website-us-west-2.amazonaws.com/PR-4731 \
    -f os_version=3.5.0 \
    -f os_prerelease_tag=-rc1 \
    -f os_build_sha=f9e7e978ae
```
