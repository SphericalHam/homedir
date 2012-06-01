TARGETS                      =  known_hosts config
REMOTE_TRUSTED_KNOWN_HOSTS   =

all: $(TARGETS)

config: $(wildcard config_*) config.default
	@-chmod 600 $@
	cat $^ > $@
	@chmod 400 $@

known_hosts: $(REMOTE_TRUSTED_KNOWN_HOSTS) $(filter-out $(REMOTE_TRUSTED_KNOWN_HOSTS), $(wildcard known_hosts_*)) known_hosts.default
	@-chmod 600 $@
	cat $^ > $@
	@chmod 400 $@

clean:
	-rm -f $(TARGETS) $(REMOTE_TRUSTED_KNOWN_HOSTS)

### Stick your methods for gather remote trusted hosts here
###
### An illustrative example:
#known_hosts_foo:
#	scp trusteduser@bar:/path/to/trusted/ssh/known/hosts/file $@



.PHONY: $(REMOTE_TRUSTED_KNOWN_HOSTS)
