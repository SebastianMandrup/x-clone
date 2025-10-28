- server_db.php untracked but needed in prod env
- manually insert server_db.php with FileZilla fex.
- github action set up to port the rest of the files (minus dev env)

- main branch is now effectivly prod
  - all development shouldnt happen on a feature branch
  - merge when development is finished
- 