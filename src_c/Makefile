# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: galy <galy@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/09 15:00:23 by galy              #+#    #+#              #
#    Updated: 2018/05/25 13:43:14 by galy             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC		=	clang
CFLAGS	=	-Wall -Werror -Wextra
# CFLAGS	=	-Wall -Werror -Wextra -fsanitize=address -g

####DIRECTORY####

SRCDIR		=	.
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


####RULEZ####

all			: OBJD
	$(CC) $(SRCDIR)/Colleen.c -o $(SRCDIR)/Colleen
	$(CC) $(SRCDIR)/Grace.c -o $(SRCDIR)/Grace
	$(CC) $(SRCDIR)/Sully.c -o $(SRCDIR)/Sully

clean		:
	$(RM) -r $(OBJDIR)

mini_clean	:

fclean		: clean
	$(RM) $(SRCDIR)/Colleen
	$(RM) $(SRCDIR)/Grace
	$(RM) $(SRCDIR)/Sully
	$(RM) Grace_kid.c

re			: fclean print_inter_line all


####MORE_RULEZ####

$(OBJDIR)/%.o: $(SRCDIR)/%.s
	$(CC) $(CFLAGS) $^ -o $@

print_inter_line	:
	@printf "$(CBLUE+)	-----$(CRESET)	$(CWHITE)-----	$(CRED)-----$(CRESET)\n"

OBJD		:
	@mkdir -p $(OBJDIR)

