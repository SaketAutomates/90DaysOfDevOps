git config --global user.name "YourName" - Sets global username for commits across all repositories.
git config --global user.email "you@example.com" - Sets global email address for commits across all repositories.
git config --global user.name - Displays globally configured username stored in Git configuration file.
git config --global user.email - Displays globally configured email stored in Git configuration file.
git config user.name - Shows repository-specific username overriding global configuration if present.
git config user.email - Shows repository-specific email overriding global configuration if present.
git config --list - Prints all Git configuration entries including username and email.
git config --show-origin --list - Displays configuration values with source files for clarity.
git commit -m "Initial commit" - Records staged changes into repository history with commit message.
git clone https://github.com/user/repo.git - Creates local copy of remote repository for collaboration.


# 🌿 Git Branching Cheat Sheet

## 📌 Create Branch
- Create branch (stay on current):
  `git branch branch_name`
- Create + switch:
  `git switch -c branch_name`
  *(older)* `git checkout -b branch_name`

---

## 📋 List Branches
- Local: `git branch`
- Remote: `git branch -r`
- All: `git branch -a`

---

## 🔄 Switch Branches
- Switch existing:
  `git switch branch_name`
  *(older)* `git checkout branch_name`

---

## 🛠️ Rename Branch
- Current branch:
  `git branch -m new_name`
- Specific branch:
  `git branch -m old_name new_name`

---

## 🔀 Merge Branch
- Merge into current branch:
  `git merge branch_name`

---

## 🗑️ Delete Branch
- Local (safe):
  `git branch -d branch_name`
- Local (force):
  `git branch -D branch_name`
- Remote:
  `git push origin --delete branch_name`

---

## 🌐 Track Remote Branch
- Create local branch tracking remote:
  `git switch -c branch_name origin/branch_name`

---

## 🧭 Detached HEAD
- Checkout commit directly:
  `git checkout <commit-hash>`

