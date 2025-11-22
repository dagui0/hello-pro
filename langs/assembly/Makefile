COMMON_TARGETS = run clean docker-clean

.PHONY: $(COMMON_TARGETS)

$(COMMON_TARGETS):
	@for d in *; do \
	    if [ -d $$d -a ! -e $$d/.skip ]; then \
	        $(MAKE) --no-print-directory -C $$d $@; \
	    fi; \
	done
