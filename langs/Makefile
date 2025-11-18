.PHONY: run clean

run clean:
	@for d in *; do \
	    if [ -d $$d -a ! -e $$d/.skip ]; then \
	        $(MAKE) --no-print-directory -C $$d $@; \
	    fi; \
	done
