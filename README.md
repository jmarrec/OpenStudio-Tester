# Tester for OpenStudio SDK

Tests a given [NREL/OpenStudio](https://github.com/NREL/OpenStudio) installer on:

* A **clean** docker `ubuntu:focal`
* The Github-Hosted action runners for `macos-latest` and `windows-latest`
    * **Caveat**: these have a lot of developer tools already installed, so we might be missing some issues...


TODO:

* Implement a `repository_dispatch` event? `workflow_dispatch` can also be triggered by API
    * Pros of `repository_dispatch` v. `workflow_dispatch`
        * Repository dispatch allows passing an event type, that event type could potentially trigger several workflows
    * Cons:
        * Repository dispatch only runs on the default branch, cannot specify branch
        * Repository dispatch will impose a burden of having to deal with inputs/client_payload differently
* Move it to NREL/OpenStudio, and have Jenkins POST the `repository_dispatch` / `workflow_dispatch` event with the payload


## Triggering the workflow_dispatch from the terminal

### Using gh CLI (authenticated already)

```shell
gh workflow -R jmarrec/OpenStudio-Tester run manual_installer_test.yml \
    -f base_url=http://openstudio-ci-builds.s3-website-us-west-2.amazonaws.com/3.8.0-rc2 \
    -f os_version=3.8.0 \
    -f os_prerelease_tag=-rc2 \
    -f os_build_sha=ca1c536250
```

### Manual POST request

Create a Personal Access Token with a `repo` scope (grant access only to this repo):

* For `workflow_dispatch`: set permissions to `actions:write`, which this gives `metadata:read` as mandatory too
* For `repository_dispatch`: set permissions to `contents:write`, and `metadata:read`

#### Workflow dispatch example

```shell
curl \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $REPO_ACCESS_TOKEN" \
  https://api.github.com/repos/jmarrec/OpenStudio-Tester/actions/workflows/test_repo_dispatch.yml/dispatches \
  -d '{"ref":"main","inputs":{"base_url": "http://openstudio-ci-builds.s3-website-us-west-2.amazonaws.com/PR-4731", "os_version": "3.5.0", "os_prerelease_tag": "-rc1", "os_build_sha": "f9e7e978ae"}}'
```

#### Repository dispatch example

```shell
curl \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $REPO_ACCESS_TOKEN" \
  https://api.github.com/repos/jmarrec/OpenStudio-Tester/dispatches \
  -d '{"event_type":"on-demand-test","client_payload":{"base_url": "http://openstudio-ci-builds.s3-website-us-west-2.amazonaws.com/PR-4731", "os_version": "3.5.0", "os_prerelease_tag": "-rc1", "os_build_sha": "f9e7e978ae"}}'
```

