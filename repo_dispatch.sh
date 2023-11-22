if [ -z $REPO_ACCESS_TOKEN ]; then
  echo "Please export REPO_ACCESS_TOKEN=github_pat_xxxx before running this"
fi

curl \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $REPO_ACCESS_TOKEN" \
  https://api.github.com/repos/jmarrec/OpenStudio-Tester/dispatches \
  -d '{"event_type":"on-demand-ubuntu-test","client_payload":{"base_url": "http://openstudio-ci-builds.s3-website-us-west-2.amazonaws.com/PR-4731", "os_version": "3.5.0", "os_prerelease_tag": "-rc1", "os_build_sha": "815a9c57e0"}}'
