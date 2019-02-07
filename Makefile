include make-do.mk

$(call require-env, user_name)

USER_HOME ?= /home/${user_name}
PUBLIC_HTML ?= ${USER_HOME}/public_html

create-user: ${USER_HOME} ${PUBLIC_HTML} facls

${USER_HOME}: require-env-user_name
	@# https://en.wikipedia.org/wiki/Gecos_field
	test -d ${USER_HOME} || \
	sudo adduser --disabled-password --gecos "${user_name}"  ${user_name}

${PUBLIC_HTML}: ${USER_HOME}
	mkdir ${PUBLIC_HTML}

facls: ${PUBLIC_HTML}
	setfacl -Rm 'mask:rwx' ${PUBLIC_HTML}
	setfacl -Rm 'd:u:www-data:rwX,u:www-data:rwX' ${PUBLIC_HTML}
	setfacl -Rm 'd:g:maint:rwX,g:maint:rwX' ${PUBLIC_HTML}

destroy-user:
	$(call user-confirm, 'This operation will DESTROY ${USER_HOME} and can not be un-done. Continue?')
	deluser ${user_name}
	rm -rf ${USER_HOME}
