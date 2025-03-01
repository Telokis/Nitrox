#!/bin/bash

set -e

OUT_DIR="${1:-./bundle}"

echo "Bundling Nitrox to $OUT_DIR"

echo "Cleaning output dir"
rm -rf "$OUT_DIR"

# echo "  ______       _  _   __          __ _        "
# echo " |  ____|     | || |  \\ \\        / /(_)       "
# echo " | |__  _   _ | || |   \\ \\  /\\  / /  _  _ __  "
# echo " |  __|| | | || || |    \\ \\/  \\/ /  | || '_ \\ "
# echo " | |   | |_| || || |     \\  /\\  /   | || | | |"
# echo " |_|    \\__,_||_||_|      \\/  \\/    |_||_| |_|"
# echo "                                              "
# echo "                                              "

dotnet clean
dotnet restore
dotnet build -c Release Nitrox.Launcher

echo -e "\nCopying files to output dir..."
cp -r "Nitrox.Launcher/bin/Release/net9.0" "$OUT_DIR"

# echo "   _____                                  _       _                     "
# echo "  / ____|                                | |     (_)                    "
# echo " | (___    ___  _ __ __   __ ___  _ __   | |      _  _ __   _   _ __  __"
# echo "  \\___ \\  / _ \\| '__|\\ \\ / // _ \\| '__|  | |     | || '_ \\ | | | |\\ \\/ /"
# echo "  ____) ||  __/| |    \\ V /|  __/| |     | |____ | || | | || |_| | >  < "
# echo " |_____/  \\___||_|     \\_/  \\___||_|     |______||_||_| |_| \\__,_|/_/\\_\\"
# echo "                                                                        "
# echo "                                                                        "

# RUNTIME="linux-x64"
# echo "Building with Runtime: $RUNTIME"
# dotnet clean
# dotnet restore
# dotnet publish -r $RUNTIME -c Release --framework net9.0

# echo -e "\nCopying files to output dir..."
# cp -r "NitroxServer-Subnautica/bin/Release/net9.0/$RUNTIME/publish" "$OUT_DIR/nitrox_server_linux"
# cp -r "NitroxServer-Subnautica/bin/Release/net9.0/$RUNTIME/lib" "$OUT_DIR/nitrox_server_linux/lib"

echo -e "\nEverything is done!"
