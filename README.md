
# Docs User Utility

Create (and destroy) system users for the purpose of hosting documentation.

## Sugested Installation

* Deploy to /usr/local/lib/docs-user
* ln -s /usr/local/lib/docs-user/docs-user /usr/local/bin/docs-user

## Usage

Comes with command completion (via make-do). So, TAB-TAB your way to glory.

Note, any operation will require the user_name variable be set. Command completion is a bit clumsy without it.

You can also customize the behaviour by setting `PUBLIC_HTML` or `USER_HOME`.

## Examples

### Create a User named grav

`user_name=grav docs-user create-user`

### Destroy a User named grav

`user_name=grav docs-user destroy-user`

### Repair Permissions for public_html for the user named grav

`user_name=grav docs-user facls`
