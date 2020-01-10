function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    MPLBACKEND="agg" python -c "import linearmodels; linearmodels.test(['-n','auto','--skip-slow','--skip-smoke'])"
}
