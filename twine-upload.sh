#!/usr/bin/env bash

echo "PWD: ${PWD}"
echo ls ./wheelhouse/
ls ./wheelhouse/

if [[ ${TESTPYPI_UPLOAD} == true  || ${PYPI_UPLOAD} == true ]]; then
    python -m pip install twine
    if [[ ${TESTPYPI_UPLOAD} == true ]]; then
        twine upload --skip-existing --repository-url https://test.pypi.org/legacy/ -u $TESTPYPI_USERNAME -p $TESTPYPI_PASSWORD ./wheelhouse/*.whl
    else
        echo "Test PyPi upload is disabled"
    fi

    if [[ ${PYPI_UPLOAD} == true ]]; then
        twine upload --skip-existing -u $PYPI_USERNAME -p $PYPI_PASSWORD ./wheelhouse/*.whl
    else
        echo "PyPi upload is disabled"
    fi
else
    echo "All PyPi uploading is disabled"
fi
