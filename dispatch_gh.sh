gh workflow -R jmarrec/OpenStudio-Tester run manual_installer_test.yml \
    -f base_url=http://openstudio-ci-builds.s3-website-us-west-2.amazonaws.com/3.8.0-rc2 \
    -f os_version=3.8.0 \
    -f os_prerelease_tag=-rc2 \
    -f os_build_sha=ca1c536250 \
    --ref ruby3.2.2
