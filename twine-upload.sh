#!/usr/bin/env bash

if [[ ${TESTPYPI_UPLOAD} == true  || ${PYPI_UPLOAD} == true ]]; then
    if [[ -n ${IS_OSX} ]]; then
        get_macpython_environment 3.6 twine-env
        source twine-env/bin/activate
        pip install --upgrade pip wheel
    fi
    pip install twine
    echo ${TRAVIS_BUILD_DIR}/wheelhouse/
    ls ${TRAVIS_BUILD_DIR}/wheelhouse/
    if [[ ${TESTPYPI_UPLOAD} == true ]]; then
          twine upload --skip-existing --repository-url https://test.pypi.org/legacy/ -u $TESTPYPI_USERNAME -p $TESTPYPI_PASSWORD ${TRAVIS_BUILD_DIR}/wheelhouse/*.whl
    else
        echo "Test PyPi upload is disabled"
    fi
    
    if [[ ${PYPI_UPLOAD} == true ]]; then
        twine upload --skip-existing -u $PYPI_USERNAME -p $PYPI_PASSWORD ${TRAVIS_BUILD_DIR}/wheelhouse/*.whl
    else
        echo "PyPi upload is disabled"
    fi
else
    echo "All PyPi uploading is disabled"
fi
