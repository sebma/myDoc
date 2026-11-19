# Mismatch de user.name avec le repo remote
Si vous rencontrez le message suivant lors d'un `git push` :
```git
remote: GitLab: Your git author name is inconsistent with GitLab account name
To gitlab. com: dsi-company/ops/my-repo.git
! [remote rejected] maj-cert-company-sebm -> maj-cert-company-sebm (pre-receive hook declined)
error: failed to push some refs to 'gitlab. com: dsi-company/ops/my-repo.git'
```
alors taper les commandes suivantes :
```shell
git log --format='%h %an <%ae>' origin/main..HEAD # Pour voir avec quel "user.name" a été fait le commit
git config user.name SebM@Societe # A ADAPTER : Pour changer le user.name
git commit --amend --reset-author --no-edit # Pour MAJ le commit avec le nouveau "user.name"
```
