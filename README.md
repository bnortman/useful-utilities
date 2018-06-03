# Useful Utilities
A Set of useful tools for Development and Operations automatiion
1.  buildSourceTree.sh
*   Enabling you to pull down multiple organizationations repositories.
2.  Current Support for git/github, with hg/bitbucket support comming soom.



## GitHub Organization Sync Utility  
**Location:** (/bash-scripts/buildSourceTree.sh)  
- This script will build a full Organization Github clone environment. 
- This was designed for use on a Mac, but Linux with bash should work
- This will only handle organizations with less than 400 Repos (Assuming paging limits on GitHub API)
- Built to help sync Github to OpenGrok
- Also useful to keep the complete organization source code pulled and refreshed for development
    
