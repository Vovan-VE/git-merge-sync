#!/bin/bash

# read README first and comment or remove this when you will sure
echo "This script is just a template. Please, read README."; exit 42


# write path to git-merge-sync here
GIT_MERGE_SYNC_PATH="/PATH/TO/git-merge-sync"

# write branches names here in the order you need
WORK_AT_BRANCHES=(ver-1 ver-2 ver-3 BRANCHES NAMES ARE HERE)

# will put action options here
DO_ACTIONS=()

# read options
if ! options=$(getopt -u -o hlms -l help,pull,merge,push -- "$@") ; then
	exit 1;
fi

# parse options
set -- $options
while [ $# -gt 0 ]; do
	case "$1" in
		(-h|--help)
			read -r -d '' USAGE <<USAGE
Wrapper for git-merge-sync to manage a "version-N" branches
in "<REPO>" repository.

Usage:
$0 [actions...]
$0 { -h | --help }

OPTIONS

	-h, --help
		Show this help message.

	-l, --pull
		Perform the pull action.

	-m, --merge
		Perform the merge action.

	-s, --push
		Perform the push action.

EXAMPLE
	$0 -lm
.
USAGE
			echo "$USAGE"
			exit 255
		;;

		(-l|--pull)
			DO_ACTIONS+=(--pull)
		;;

		(-m|--merge)
			DO_ACTIONS+=(--merge)
		;;

		(-s|--push)
			DO_ACTIONS+=(--push)
		;;

		(--) shift; break;;
		(-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
		(*)  break;;
	esac
	shift
done

# no arguments must left
if [ $# -gt 0 ]; then
	echo "$0: error - Invalid usage. Try"
	echo -e "\t$0 --help"
	exit 1
fi

# run the tool
"$GIT_MERGE_SYNC_PATH" ${DO_ACTIONS[*]} -- "${WORK_AT_BRANCHES[@]}"
