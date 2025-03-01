#!/bin/bash

set -ex

OUT_DIR="${1:-./bundle_out}"
RUNTIME="${2:-win-x64}"

echo "Bundling Nitrox Launcher to $OUT_DIR"

echo "Cleaning output dir"
rm -rf "$OUT_DIR"

dotnet clean

dotnet restore

dotnet publish -r $RUNTIME -c Release --framework net9.0

echo -e "\nCopying files to output dir..."
cp -r "Nitrox.Launcher/bin/Release/net9.0/$RUNTIME/publish" "$OUT_DIR"
cp -r "Nitrox.Launcher/bin/Release/net9.0/$RUNTIME/lib" "$OUT_DIR/lib"

cp "NitroxServer-Subnautica/bin/Release/net9.0/$RUNTIME/publish/NitroxServer-Subnautica.deps.json" "$OUT_DIR/"

echo -e "\nEverything is done!"
