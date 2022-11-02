# Tester for OpenStudio SDK

Tests a given [NREL/OpenStudio](https://github.com/NREL/OpenStudio) installer on:

* A **clean** docker `ubuntu:focal`
* The Github-Hosted action runners for `macos-latest` and `windows-latest`
    * **Caveat**: these have a lot of developer tools already installed, so we might be missing some issues...


TODO:

* Implement a `repository_dispatch` event
* Move it to NREL/OpenStudio, and have Jenkins POST the `repository_dispatch` event with the payload
