#! /bin/bash
# Copyright 2016, William "Cap10Bill" Nortman (bnortman@yahoo.com)
#
# Release under Apache License Version 2.0 (https://www.apache.org/licenses/LICENSE-2.0)
#
# No Warranty, Usage at your own risk. Please review the script before using.
#
# This script will build a full Organization Github clone environment. 
#		This was designed for use on a Mac, but Linux with bash should work
#		This will only handle organization with less than 400 Repos (Assuming paging limits on GitHub API)
#
# Assumptions -------
#
# Working from User Directory (cd ~). So copy this script to that directory
#
# Will create the subdirectory is needed. Shows a NON critical error if it already exists
#
# Create two files in that directory
# 	cloneRepo.sh 	- Run this to clone any new Repos in your Organization
#	pullRepo.sh 	- Run this to get lastest code from Repo for you Organization
#
# Usage
#
#	Generally you run this script once at the beginning then everytime you get a new Repo in your
#	organization. It will overwrite the existing .sh files with newone.
#
# 	You then need to run the cloneRepo.sh the first time and every time a new repo in added
#
#	you then need to run the pullRepo.sh every time you want to get the latest code from Github.
#
# --------------------------------------


# Get User Input
echo -n "Enter GitHub Organization Base :"

read GitHubOrg

echo -n "Enter SubDirectory to Create :"

read SubD

echo -n "Enter Github Username :"

read Username

echo -n "Enter Github Password :"

read -s Password1

echo " "
echo " "

# Output Configuration to confirm input
echo "Organization is : " $GitHubOrg
echo "SubDirectory is : " $SubD
echo "Username is : " $Username

echo " "
echo "Press Enter to Continue.... [Control-C] to Terminate Script"

# Pause for User to Review
read GoDoIt


# Create Subdirectory if it doesn't exist, user just ignore error if it exists
mkdir $SubD

curl --user "$Username:$Password1" -s "https://api.github.com/orgs/$GitHubOrg/repos?per_page=100&page=1" | grep -e 'git_url*' | cut -d \" -f 4 
curl --user "$Username:$Password1" -s "https://api.github.com/orgs/$GitHubOrg/repos?per_page=100&page=2" | grep -e 'git_url*' | cut -d \" -f 4 
curl --user "$Username:$Password1" -s "https://api.github.com/orgs/$GitHubOrg/repos?per_page=100&page=3" | grep -e 'git_url*' | cut -d \" -f 4 
# Connect to GitHub API and Extact up to 400 Repos
# Connect to GitHub API and Extact up to 400 Repos
curl --user "$Username:$Password1" -s "https://api.github.com/orgs/$GitHubOrg/repos?per_page=100&page=1" | grep -e 'git_url*' | cut -d \" -f 4 | cut -d / -f 5 | cut -d . -f 1 | awk -v subdir=$SubD -v org=$GitHubOrg -v user=$Username '{print "/usr/bin/git clone ssh://git@github.com/" org "/"  $1 ".git"}' >  $SubD/cloneRepo.sh
curl --user "$Username:$Password1" -s "https://api.github.com/orgs/$GitHubOrg/repos?per_page=100&page=2" | grep -e 'git_url*' | cut -d \" -f 4 | cut -d / -f 5 | cut -d . -f 1 | awk -v subdir=$SubD -v org=$GitHubOrg -v user=$Username '{print "/usr/bin/git clone ssh://git@github.com/" org "/"  $1 ".git"}' >>  $SubD/cloneRepo.sh
curl --user "$Username:$Password1" -s "https://api.github.com/orgs/$GitHubOrg/repos?per_page=100&page=3" | grep -e 'git_url*' | cut -d \" -f 4 | cut -d / -f 5 | cut -d . -f 1 | awk -v subdir=$SubD -v org=$GitHubOrg -v user=$Username '{print "/usr/bin/git clone ssh://git@github.com/" org "/"  $1 ".git"}' >>  $SubD/cloneRepo.sh


curl --user "$Username:$Password1" -s "https://api.github.com/orgs/$GitHubOrg/repos?per_page=100&page=1" | grep -e 'git_url*' | cut -d \" -f 4 | cut -d / -f 5 | cut -d . -f 1 | awk -v subdir=$SubD -v org=$GitHubOrg -v user=$Username '{print "cd ~/" subdir "/" $1 "\n/usr/bin/git pull ssh://git@github.com/" org "/"  $1 ".git\ncd ~"}' >  $SubD/pullRepo.sh
curl --user "$Username:$Password1" -s "https://api.github.com/orgs/$GitHubOrg/repos?per_page=100&page=2" | grep -e 'git_url*' | cut -d \" -f 4 | cut -d / -f 5 | cut -d . -f 1 | awk -v subdir=$SubD -v org=$GitHubOrg -v user=$Username '{print "cd ~/" subdir "/" $1 "\n/usr/bin/git pull ssh://git@github.com/" org "/"  $1 ".git\ncd ~"}' >>  $SubD/pullRepo.sh
curl --user "$Username:$Password1" -s "https://api.github.com/orgs/$GitHubOrg/repos?per_page=100&page=3" | grep -e 'git_url*' | cut -d \" -f 4 | cut -d / -f 5 | cut -d . -f 1 | awk -v subdir=$SubD -v org=$GitHubOrg -v user=$Username '{print "cd ~/" subdir "/" $1 "\n/usr/bin/git pull ssh://git@github.com/" org "/"  $1 ".git\ncd ~"}' >>  $SubD/pullRepo.sh

chmod 700 $SubD/cloneRepo.sh
chmod 700 $SubD/pullRepo.sh

echo " "
echo "Completed please change to Subdirectory " $SubD
echo " "


