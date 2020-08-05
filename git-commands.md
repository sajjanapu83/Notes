```
git 
git add .
git commit -m'modified'
git commit -a -m'add & commit in single step'
git status
git show

git remote -v
git log --pretty=oneline --graph
git log -p
git log <<commitid>> HEAD -p
git log <<commitid>> HEAD^^^^^..HEAD^^
git log <<commitid>> HEAD~5..HEAD~2

git branch branch-01 // new branch created by userA
git checkout branch-01
git checkout -b branch-02 // new branch created by userB
git branch // shows local branches
git branch -a //shows all branches includes remote branches
** Remote branches are locally immutable

user-01:
git checkout -b branch-02
echo "hello" >> hellotest.txt
git commit -a -m'new filed added by user-01 for the branch created by user-02"

User-02 is on Branch-02:
git branch --set-upstream <<localbranch>> <<remote refspec>> 
git branch --set-upstream branch-02 origin/branch-02  // now tracking is done bi-directional
git pull // now it merges remote origin to local automatically



git branch yesterday <<commitid>>

git push command talks to the network

git push
git push origin <<branchName>>
git push remote <<branchName>>

git fetch 
git diff branch-02 origin/branch-02




```
