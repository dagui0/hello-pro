.PHONY: run clean

run:
	for d in *; do \
	    if [ ! -e $$d/.skip ]; then \
	        $(MAKE) -C $$d $@; \
	    fi; \
	done

clean:
	for d in *; do \
	    if [ ! -e $$d/.skip ]; then \
	        $(MAKE) -C $$d $@; \
	    fi; \
	done
