#!/usr/bin/env sh

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: `basename $0` {bucket} {version}"
  echo ""
  echo "Please tell which s3 bucket to deploy static assets, and the version to use in the URL."
  echo ""
  echo "If you redeploy over an existing version, you'll need to use a cache-busting query string in your html."
  exit $E_BADARGS
fi

s3cmd sync --acl-public --delete-removed bootstrap/* s3://${1}/bootstrap/${2}/

