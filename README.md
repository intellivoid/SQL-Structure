# SQL-Structure

Intellivoid's entire database structure in one place while making it easy
to build a full .sql file that can be executed on the server.

## Build

To build all sql structures simply run

```shell
make all
```

To build individual structures here are the following tasks that
are currently written into the Makefile

 - `coffeehouse`
 - `intellivoid`
 - `intellivoid_api`
 - `intellivoid_suite`
 - `khm`
 - `openblu`
 - `spam_protection`
 - `socialvoid_master`
 - `socialvoid_slave`
 - `tdlib`
 - `tdlib_spamprotectionbot` (**Requires** `tdlib` build)
 - `tdlib_intellivoidbot` (**Requires** `tdlib` build)
 - `all_intellivoid`
 - `all_socialvoid`
 - `all_tdlib`
 - `all`

## Version structure and updates

Each update to the database structure no matter how large or small
will require a bump in the version alongside a patch script, a patch
script is intended to run in an environment where the following is
available

 - `mysql`
 - `mysql-dump`
 - `ppm`
 - `net.intellivoid.msqg`
 - `php`
 - `php-mysql`

All patches must be designed to run during production without the
need to take services offline, either by migrating data from old
tables to new tables or applying changes to the existing tables.
Keep in mind there may be locking issues if you go with the second

Patches will only work per version bump, so that means if the
latest branch is `v5` and you are on `v2`, you will need to run
patches to update to `v3` then to `v4` and finally to `v5`, you
should not skip patches as not all patches will inherit patches
from the previous versions. However, on clean environments this
is not required as you can simply build the structure and run it
in its entirety without the need of patches.

It's important to read the patch notes to see what is required
to preform a patch and how to preform a patch and or fix any issues
that may arise when patching to the latest version.

Patches must create a backup of the tables it wishes to drop and
delete from the structure or change, so make sure your environment
has enough space to allow for the export of large .sql files just
in case if something goes wrong, and you need to revert the patch.

Some patches will save their steps so if a step fails it will allow
you the chance to correct the error and resume the patch from where
it left of.

## Branches

 - The `master` branch will reflect the latest version (production)
 - Any branch that starts a prefix of `v` such as `v1`, `v5` and so on is
   the archived version, it's there for archival purposes and updates
 - The `dev` branch is the experimental wip version of the SQL-Structure
   which will reflect unfinished or unstable conditions and usually
   used for development purposes only so that developers can share
   the same database structure during the development cycle of a project.


## Folder structure

All database structures are found under `database_src` and structure
builds created from the Makefile will be found under `build`

**DO NOT PUSH THE BUILD FOLDER TO THE REPOSITORY**

And all patches are found under `patches` in for their respective
versions, eg; `patches/v2` will contain patches to upgrade from
`v1` to `v2`, again make sure to not skip patches.