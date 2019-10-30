if "%TESTPYPI_UPLOAD%" == "true" (
    twine upload --skip-existing --repository-url https://test.pypi.org/legacy/ -u %TESTPYPI_USERNAME% -p %TESTPYPI_PASSWORD% linearmodels/dist/*
) else (
    echo "Test PyPi upload is disabled"
)
if "%PYPI_UPLOAD%" == "true" (
    twine upload --skip-existing -u %PYPI_USERNAME% -p %PYPI_PASSWORD% linearmodels/dist/*
) else (
    echo "PyPi upload is disabled"
)