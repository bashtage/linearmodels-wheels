#!/usr/bin/env bash

echo "PWD: ${PWD}"
echo ls ./wheelhouse/
ls ./wheelhouse/

if [[ ${TESTPYPI_UPLOAD} == true  || ${PYPI_UPLOAD} == true ]]; then
    python -m pip install twine
    if [[ ${TESTPYPI_UPLOAD} == true ]]; then
        twine upload --skip-existing --repository-url https://test.pypi.org/legacy/ -u __token__ -p $TESTPYPI_TOKEN ./wheelhouse/*.whl
    else
        echo "Test PyPi upload is disabled"
    fi

    if [[ ${PYPI_UPLOAD} == true ]]; then
        twine upload --skip-existing -u __token__ -p $PYPI_TOKEN ./wheelhouse/*.whl
    else
        echo "PyPi upload is disabled"
    fi
else
    echo "All PyPi uploading is disabled"
fi
