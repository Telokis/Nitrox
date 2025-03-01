#!/bin/bash

set -ex

OUT_DIR="${1:-./bundle_out}"

echo "Bundling Nitrox Launcher to $OUT_DIR"

echo "Cleaning output dir"
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

dotnet clean

dotnet restore

dotnet publish -r win-x64 -c Release --self-contained --framework net9.0

echo -e "\nCopying files to output dir..."
cp -r "Nitrox.Launcher/bin/Release/net9.0/win-x64/publish" "$OUT_DIR"
cp -r "Nitrox.Launcher/bin/Release/net9.0/win-x64/lib" "$OUT_DIR/lib"

echo -e "\nEverything is done!"
