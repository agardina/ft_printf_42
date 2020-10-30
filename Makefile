#FORMATTING

GREEN = "\\033[32m"
BOLD = "\\033[1m"
RESET_FORMAT = "\\033[0m"
ERASE_LINE = "\\033[A\\033[K\\033[A"

#COMPILATION

NAME = libftprintf.a

CC = gcc

CFLAGS = -Wall -Wextra -Werror

LIB_DIR = ./libft
LIB_INC = $(LIB_DIR)/inc
LIB = $(LIB_DIR)/libft.a

SRC_DIR = ./src/
SRC_FILES = bin.c buffer.c buffer2.c char.c colors.c hex.c int_utils.c loop.c oct.c \
parsing.c parsing_bis.c parsing_utils.c pointers.c signed.c string.c unsigned.c floats/deal_inf_nan.c floats/double.c \
floats/get_bigint_info.c floats/long_double.c floats/op.c floats/print_big_dbl.c \
floats/print_dec_part.c floats/print_int_part.c floats/print_small_dbl.c \
floats/round_up.c floats/store_dbl.c floats/store_ldbl.c floats/utils.c
SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))

OBJ_DIR = ./obj/
OBJ_FILES = $(SRC_FILES:.c=.o)
OBJ = $(addprefix $(OBJ_DIR), $(OBJ_FILES))

HDR_DIR = ./inc/
HDR_FILES = prototypes.h structs.h
HDR = $(addprefix $(HDR_DIR), $(HDR_FILES))

all: $(NAME)

$(NAME): $(LIB) $(OBJ)
	@echo "Object files related to ft_printf created"
	@cp $(LIB) $(NAME)
	@ar -rc $(NAME) $(OBJ)
	@ranlib $(NAME)
	@echo "$(BOLD)$(NAME)$(RESET_FORMAT) [$(GREEN)OK$(RESET_FORMAT)]"

$(LIB): FORCE
	@make -C $(LIB_DIR)

$(OBJ_DIR)%.o:$(SRC_DIR)%.c $(HDR)
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(OBJ_DIR)floats/
	@$(CC) -c $(CFLAGS) -I$(LIB_INC) -I$(HDR_DIR) -o $@ $<
	@echo "Compiled: $*.o [$(GREEN)OK$(RESET_FORMAT)]"
	@echo "$(ERASE_LINE)"

clean:
	@rm -rf $(OBJ)
	@rm -rf $(OBJ_DIR)floats/
	@rm -rf $(OBJ_DIR)
	@echo "Object files related to ft_printf deleted"
	@make -C $(LIB_DIR) clean

fclean: clean
	@rm -rf $(NAME)
	@echo "$(NAME) deleted"
	@make -C $(LIB_DIR) fclean

re:
	@$(MAKE) fclean
	@echo ""
	@$(MAKE) all

FORCE:

.PHONY: all clean fclean re FORCE
