CC =	gcc

FLAG =	-Wall -Wextra -Werror

L =		ar rc

RLIB =	ranlib

LFLAG =	-L libft/ -lft

NAME =	libftprintf.a

SRCS =	ft_printf.c \
		print_character.c \
		print_decimal.c \
		print_hexadecimal_lower.c \
		print_hexadecimal_upper.c \
		print_pointer.c \
		print_u.c \
		print_string.c
	

OBJS =	$(SRCS:.c=.o)

all: 	$(NAME)

frame:
		@mkdir $(FDIR)
		@echo "$(FDIR): has been created"

$(NAME): $(OBJS) $(LIB)
		@$(L) $(NAME) $(OBJS) $(LFTOB)
		@$(RLIB) $(NAME)
		@echo "$(NAME): has been created"

frame/%.o: %.c | frame
		@$(CC) $(FLAG) -c $< -o $@

$(LIB):
		@make re -C $(LFT)
		@echo "$(LFT): has been created"

clean:
		@rm -f $(OBJS)
		@rm -rf $(FDIR)
		@echo "$(FDIR) & $(OBJS): have been cleaned"

fclean:	clean
		@rm -f $(NAME)
		@echo "$(NAME) & $(LFT): have been cleaned"

re: fclean all

.PHONY: all clean fclean re