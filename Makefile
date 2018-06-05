# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: galy <galy@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/06/04 15:18:33 by galy              #+#    #+#              #
#    Updated: 2018/06/04 17:57:30 by galy             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

####DIRECTORY####

DIR_C		=	src_c
DIR_ASM		=	src_asm

####COLOR-SET####

CRESET		=	\033[0m
CRED		=	\033[31m
CGREEN		=	\033[32m
CGREEN+		=	\033[32;1;5m
CYELLOW		=	\033[33m
CYELLOW+	=	\033[33;1m
CBLUE		=	\033[34m
CBLUE+		=	\033[34;1m
CMAGENTA	=	\033[35m
CCYAN		=	\033[36m
CWHITE		=	\033[37m


####CURSOR-SET####

CUR_SVE		=	\033[s
CUR_RST		=	\033[u
CUR_CLR		=	\033[K


####RULEZ####

all			:
	make -C $(DIR_C)
	make -C $(DIR_ASM)
clean		:
	make -C $(DIR_C) clean
	make -C $(DIR_ASM) clean

fclean		:
	make -C $(DIR_C) fclean
	make -C $(DIR_ASM) fclean

re			: fclean re
