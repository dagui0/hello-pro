.PHONY: run clean

run:
	for d in *; do \
	    if [ -d $$d -a ! -e $$d/.skip ]; then \
	        $(MAKE) -C $$d $@; \
	    fi; \
	done

clean:
	for d in *; do \
	    if [ -d $$d -a ! -e $$d/.skip ]; then \
	        $(MAKE) -C $$d $@; \
	    fi; \
	done
