# Variables
$rootURL = "https://johnley-toolbox.nyc3.cdn.digitaloceanspaces.com/cli-apps/windows/"
$appName = "speedtest.exe"
$tempdir = "C:\temp\"
$runargs = "--accept-license","--accept-gdpr"

#Test for temp folder and create if necessary 
if(!(Test-Path -Path $tempdir)){
    New-Item -ItemType Directory -Force -Path $tempdir
}

# Download the file and save it to the temp directory
$source = $rootURL + $appName
$destination = $tempdir + $appName
Start-BitsTransfer -Source $source -Destination $destination

# Run the app
& $destination $runargs

# Cleanup temp folder
Remove-Item -Path $destination -Force