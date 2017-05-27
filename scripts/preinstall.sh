#!/bin/bash
set -ex

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then

    # Install some custom requirements on OS X
    openssl aes-256-cbc -K $encrypted_faf2708e46e2_key -iv $encrypted_faf2708e46e2_iv -in packages/client-private-plugins/encrypted_certificates/travis/travis-files.tar.enc -out packages/client-private-plugins/encrypted_certificates/travis/travis-files.tar -d
    mkdir packages/client-app/build/resources/certs
    tar xvf packages/client-private-plugins/encrypted_certificates/travis/travis-files.tar --directory=packages/client-app/build/resources/
    source packages/client-app/build/resources/certs/mac/set_unix_env.sh
fi
