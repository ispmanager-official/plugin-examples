#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <directory-name>"
    echo "Example: $0 template-nginx-rate-limit"
    exit 1
fi

DIR="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$SCRIPT_DIR/$DIR"

if [ ! -d "$SOURCE" ]; then
    echo "Error: directory '$SOURCE' not found"
    exit 1
fi

cp -rf "$SOURCE"/* /usr/local/mgr5/
rm -rf /usr/local/mgr5/var/.db.cache*
pkill core
