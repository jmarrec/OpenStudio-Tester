gh workflow -R jmarrec/OpenStudio-Tester run manual_installer_test.yml \
    -f base_url=https://github.com/NREL/OpenStudio/releases/download/v3.8.0-rc3 \
    -f os_version=3.8.0 \
    -f os_prerelease_tag=-rc3 \
    -f os_build_sha=d8eac889d0 \
    --ref main
