# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: galy <galy@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/09 15:00:23 by galy              #+#    #+#              #
#    Updated: 2018/05/22 10:50:29 by galy             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC		=	clang
CFLAGS	=	-Wall -Werror -Wextra
# CFLAGS	=	-Wall -Werror -Wextra -fsanitize=address -g
NA		=	/usr/local/bin/nasm
NAFLAG	=	-f macho64
# LD		=	ld

####DIRECTORY####

SRCDIR_C	=	src_c
SRCDIR_S	=	src_asm
OBJDIR		=	obj
INCDIR		=	inc

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

####SOURCE####

# SRC			= \
# 	Colleen.c


####FUNC####

# OBJ			= $(SRC:.c=.o)
# OBJP		= $(addprefix $(OBJDIR)/, $(SRC:.c=.o))


####RULEZ####

all			: OBJD
####     C     ####
	# $(CC) $(SRCDIR_C)/Colleen.c -o $(SRCDIR_C)/Colleen
	# $(CC) $(SRCDIR_C)/Grace.c -o $(SRCDIR_C)/Grace
	# $(CC) $(SRCDIR_C)/Sully.c -o $(SRCDIR_C)/Sully
####    ASM    ####
	$(NA) $(NAFLAG) $(SRCDIR_S)/Colleen.s -o./Colleen.o
	ld -macosx_version_min 10.8 -lSystem Colleen.o -o Colleen

clean		:
	$(RM) -r $(OBJDIR)
	$(RM) Colleen.o

mini_clean	:

fclean		: clean
	$(RM) $(SRCDIR_C)/Colleen
	$(RM) $(SRCDIR_C)/Grace
	$(RM) $(SRCDIR_C)/Sully
	$(RM) Grace_kid.c
	$(RM) Colleen

re			: fclean print_inter_line all


####MORE_RULEZ####

$(OBJDIR)/%.o: $(SRCDIR)/%.s
	$(CC) $(CFLAGS) $^ -o $@

print_inter_line	:
	@printf "$(CBLUE+)	-----$(CRESET)	$(CWHITE)-----	$(CRED)-----$(CRESET)\n"

OBJD		:
	@mkdir -p $(OBJDIR)

