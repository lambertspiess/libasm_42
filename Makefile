NAME		+=	libasm.a

SRCSDIR		+=	srcs

VPATH		+=	.:.
VPATH		+=	:$(SRCSDIR)/

SRCSNAMES	+=	ft_strlen.s
SRCSNAMES	+=	ft_write.s
SRCSNAMES	+=	ft_strcmp.s
SRCSNAMES	+=	ft_strcpy.s
SRCSNAMES	+=	ft_strdup.s
SRCSNAMES	+=	ft_read.s

SRCS		+=	$(addprefix $(SRCSDIR)/, $(SRCSNAMES))

OBJSDIR		+=	objs

OBJSNAMES	+=	$(SRCSNAMES:.s=.o)

OBJS		+=	$(addprefix $(OBJSDIR)/, $(OBJSNAMES))

HEADERSDIR	+=	includes

FLAGS		+=	-f elf64

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)

$(OBJS): $(OBJSDIR)/%.o: %.s
	@mkdir $(OBJSDIR) 2> /dev/null || true
	@nasm -I $(HEADERSDIR) $(FLAGS) $< -o $@
	@echo "Compiling : $<"

all: $(NAME)

clean :
	@rm testfile* || true
	@rm -r $(OBJSDIR) || true

fclean :
	@make clean || true
	@rm $(NAME) || true
	@rm testfile* || true
	@rm a.out || true

re :
	@make fclean
	@make all -j

test :
	@make re
	@gcc -I $(HEADERSDIR) ./tests/*.c libasm.a -o exec
