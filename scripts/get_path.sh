#!/bin/bash
GIT_COMMIT_DESC=$(git log --format=oneline -n 1 $1)

if [[ "$GIT_COMMIT_DESC" == *"[path="* ]]; then
		return true
else	
		return false
fi
