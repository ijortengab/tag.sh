#!/bin/bash
FLAG=(
    # Global Options:
        '--help|-h'
    # Find Options:
        '--preview|-p'
        '--all|-a'
        '--word|-w'
        '--ignore-case|-i'
        '-1'
    # Add/Delete/Clear Options:
        '--dry-run|-n'
)
MULTIVALUE=(
    # Find Options
        '--exclude-dir|-x'
)
VALUE=(
    # Add/Delete/Clear Options:
        '--directory|-d'
)
source $(dirname $0)/bash/functions/code-generator-parse-options/dev/code-generator-parse-options.function.sh

CodeGeneratorParseOptions \
    --compact \
    --no-error-invalid-options \
    --no-error-require-arguments \
    --no-hash-bang \
    --no-original-arguments \
    --without-end-options-double-dash \
    --clean \
    --output-file tag.parse_options.sh \
    --debug-file tag.debug.sh \
    $@