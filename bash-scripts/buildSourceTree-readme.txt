A utility to create a set of scripts to get all Repositories(Repos) from a GitHub Organization. 
These scripts can then be set to automatically sync the latest from a GitHub Repo. Then you can reschedule the OpenGrok reindex against the code


 This script will build a full Organization Github clone environment. 
		This was designed for use on a Mac, but Linux with bash should work
		This will only handle organization with less than 400 Repos (Assuming paging limits on GitHub API)

# Assumptions -------

 Working from User Directory (cd ~). So copy this script to that directory

 Will create the subdirectory is needed. Shows a NON critical error if it already exists

 Create two files in that directory
 	cloneRepo.sh 	- Run this to clone any new Repos in your Organization
	pullRepo.sh 	- Run this to get lastest code from Repo for you Organization

# Usage

	Generally you run this script once at the beginning then everytime you get a new Repo in your
	organization. It will overwrite the existing .sh files with newone.

 	You then need to run the cloneRepo.sh the first time and every time a new repo in added

	you then need to run the pullRepo.sh every time you want to get the latest code from Github

# Interesting Info
	Found this link [http://stackoverflow.com/questions/1891653/how-do-i-handle-git-branches-in-opengrok]
	Has a script for handling branches
	
