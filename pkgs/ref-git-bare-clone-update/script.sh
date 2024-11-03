# shellcheck disable=SC2148

# Called from garden tool, on bare normally no remote origin fetch
# informations are present on the repo. In the garden config for the
# repos the remote.origin.fetch is already set in the git config for
# the repo, but not fetch is run. Therefore run a fetch first.
git fetch origin

# The bare repo itself lives in parent-folder/.bare/
# Start point when called from git garden is the `.bare` folder,
# therefore change up into parent-folder for all tasks
cd ..

# If no `.git` file points to `./.bare`, create it
if [ ! -f ./.git ]; then echo "gitdir: ./.bare" >./.git; fi

# Set refs/remotes/origin/HEAD according to remote repo
# and fetch the default repo from the output as
# 'HEAD set to main'
origin_head="$(git remote set-head origin -a)"
default_branch=$(echo "$origin_head" | grep --only-matching '[^\ ]*$')

# If no worktree for the default branch is present, create it.
if [ ! -d "./$default_branch" ]; then
    git worktree add "$default_branch"
fi
