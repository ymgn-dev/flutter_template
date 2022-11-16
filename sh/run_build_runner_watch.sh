if type fvm > /dev/null 2>&1; then
    fvm flutter pub run build_runner watch --delete-conflicting-outputs
else
    flutter pub run build_runner watch --delete-conflicting-outputs
fi
