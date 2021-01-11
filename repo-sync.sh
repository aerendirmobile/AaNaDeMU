#!/bin/sh

#
# Copyright (C) 2016-2021 Aerendir Mobile Inc. All rights reserved.
#

pushd ()
{
	command pushd "$@" > /dev/null
}

popd ()
{
	command popd "$@" > /dev/null
}

aanademu_update_vendor ()
{
	pushd "vendor/macadam"
	git checkout aerendir
	git pull origin aerendir
	git checkout master
	git pull origin master
	git checkout aerendir
	popd

	pushd "vendor/open_mpw_precheck"
	git checkout main
	git pull origin main
	popd
}

aanademu_update_commit ()
{
	git add "vendor/macadam"
	git add "vendor/open_mpw_precheck"
	git commit -m "updating sub-modules"
	git push origin master
}

main ()
{
	aanademu_update_vendor
	aanademu_update_commit
}

main "$@"

# EOF