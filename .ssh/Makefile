TARGETS                      =  known_hosts config

# Add an explicit dependency for each remote grabbing rule defined below
REMOTE_TRUSTED_KNOWN_HOSTS   =  $(shell grep -v '^\#' Makefile | grep fetchkh | grep -v PHONY | cut -d':' -f1 | xargs echo)
REMOTE_TRUSTED_CONFIG_FILES  =  $(shell grep -v '^\#' Makefile | grep fetchcf | grep -v PHONY | cut -d':' -f1 | xargs echo)

all: $(TARGETS)

config: $(REMOTE_TRUSTED_CONFIG_FILES) $(filter-out $(REMOTE_TRUSTED_CONFIG_FILES), $(wildcard config_*)) config.default
	@-chmod 600 $@
	cat $^ > $@
	@chmod 400 $@

known_hosts: $(REMOTE_TRUSTED_KNOWN_HOSTS) $(filter-out $(REMOTE_TRUSTED_KNOWN_HOSTS), $(wildcard known_hosts_*)) known_hosts.default
	@-chmod 600 $@
	cat $^ > $@
	@chmod 400 $@

clean:
	-rm -f $(TARGETS) $(REMOTE_TRUSTED_KNOWN_HOSTS) $(REMOTE_TRUSTED_CONFIG_FILES)

### Stick your methods for gathering remote trusted hosts here
### Be sure to have each one depend on 'fetchkh'
### An illustrative example:
#known_hosts_foo: fetchkh
#	rsync -u trusteduser@bar:/path/to/trusted/ssh/known/hosts/file $@


### Stick your methods for gathering remote trusted hosts here
### Be sure to have each one depend on 'fetchcf'
### An illustrative example:
#known_hosts_foo: fetchcf
#	rsync -u trusteduser@bar:/path/to/trusted/ssh/config/file $@


.PHONY: all
.PHONY: fetchkh fetchcf
