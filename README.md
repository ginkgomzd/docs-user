----

# Docs User Utility

Create (and destroy) system users for the purpose of hosting documentation.

## Sugested Installation

* Deploy to /usr/local/lib/docs-user
* ln -s /usr/local/lib/docs-user/docs-user /usr/local/bin/docs-user

## Usage

Comes with command completion (via make-do). So, TAB-TAB your way to glory.

Note, any operation will require the USER_NAME variable be set. Command completion is a bit clumsy without it being set, so exporting the variable is recommended.

You can also customize the behaviour by setting `PUBLIC_HTML` or `USER_HOME`.

## Examples

### Create a User named grav

`USER_NAME=grav docs-user create-user`

### Destroy a User named grav

`USER_NAME=grav docs-user destroy-user`

### Repair Permissions for public_html for the user named grav

`USER_NAME=grav docs-user facls`


----
This is a make-do module: https://github.com/ginkgostreet/make-do.git
