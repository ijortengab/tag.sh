#!/bin/bash
# Create minified version.
chmod +x tag.options.sh
. tag.options.sh --no-hash-bang --compact --clean --output-file tag.parse_options.min.txt
# Replace line.
touch ../tag.sh
chmod +x ../tag.sh
SOURCE=$(<tag.dev.sh)
FILE_PARSE_OPTIONS=$(<tag.parse_options.min.txt)
FILE_FUNCTIONS=$(<tag.functions.sh)
FILE_ARRAY_DIFF=$(<bash/functions/array-diff/dev/array-diff.function.sh)
SOURCE="${SOURCE//source \$(dirname \$0)\/tag.parse_options.sh/$FILE_PARSE_OPTIONS}"
SOURCE="${SOURCE//source \$(dirname \$0)\/tag.functions.sh/$FILE_FUNCTIONS}"
SOURCE="${SOURCE//source \$(dirname \$0)\/bash\/functions\/array-diff\/dev\/array-diff.function.sh/$FILE_ARRAY_DIFF}"
echo "${SOURCE}" > ../tag.sh
# Delete line.
sed -i '/var-dump\.function\.sh/d' ../tag.sh
sed -i '/tag\.debug\.sh/d' ../tag.sh
sed -i '/VarDump/d' ../tag.sh
# Add to $PATH
cp -r ../tag.sh ~/bin/tag