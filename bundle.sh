#!/bin/bash

set -e

OUT_DIR="${1:-./bundle}"

echo "Bundling Nitrox to $OUT_DIR"

echo "Cleaning output dir"
rm -rf "$OUT_DIR"
rm -rf "Nitrox.Launcher/bin" "Nitrox.Launcher/obj"

dotnet clean
dotnet restore
dotnet build -c Release Nitrox.Launcher

echo -e "\nCopying files to output dir..."
cp -r "Nitrox.Launcher/bin/Release/net9.0" "$OUT_DIR"

echo -e "\nEverything is done!"
