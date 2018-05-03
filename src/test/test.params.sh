#!/usr/bin/env bash

echo "==> GBW: import src/test/test.params.sh"

gbw_test_count_tests=0
gbw_test_count_assertions=0
gbw_test_count_failures=0
gbw_test_assert_pipeline_message=()