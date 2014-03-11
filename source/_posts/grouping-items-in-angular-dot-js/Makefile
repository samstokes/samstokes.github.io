NAME := 2014-03-10-grouping-items-in-angular-dot-js
DEST = ../$(NAME).markdown

all: $(DEST)

$(DEST): $(NAME).otl
	sed -n '/^---/,/^---/p' $< >$@
	sed '/^---/,/^---/d' $< | OTL markdown | sed '/^%/d; s/~~~~\(\s\+{\.\(\w\+\)}\)\?/``` \L\2/' >>$@

clean:
	rm -rf $(DEST)
