include make-do.mk

$(call require-env, USER_NAME)

USER_NAME ?= root
USER_HOME ?= /home/${USER_NAME}
PUBLIC_HTML ?= ${USER_HOME}/public_html

$(info )
$(info ---)
$(info $$USER_NAME is ${USER_NAME})
$(info ---)

help:
	@pandoc -t plain README.md

create: ${USER_HOME} ${PUBLIC_HTML} facls

${USER_HOME}: require-env-USER_HOME
	@# https://en.wikipedia.org/wiki/Gecos_field
	@# --disabled-password creates a user but disallows login.
	sudo adduser --disabled-password --home ${USER_HOME} --gecos "Docs User, ${USER_NAME}"  ${USER_NAME} 

${PUBLIC_HTML}: ${USER_HOME}
	test -d ${PUBLIC_HTML} || sudo mkdir -p ${PUBLIC_HTML}

facls: ${PUBLIC_HTML}
	sudo setfacl -Rm 'mask:rwx' ${PUBLIC_HTML}
	sudo setfacl -Rm 'd:u:www-data:rwX,u:www-data:rwX' ${PUBLIC_HTML}
	sudo setfacl -Rm 'd:g:maint:rwX,g:maint:rwX' ${PUBLIC_HTML}

destroy-user:
	$(call user-confirm, 'This operation will DESTROY ${USER_HOME} and can not be un-done. Continue?')
	sudo deluser ${USER_NAME}
	sudo rm -rf ${USER_HOME}
