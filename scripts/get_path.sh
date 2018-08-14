#!/bin/bash
GIT_COMMIT_DESC=$(git log --format=oneline -n 1 $1)

if [[ "$GIT_COMMIT_DESC" == *"[path="* ]]; then
		echo "Has path"
else	
		echo "failed path"
fi
