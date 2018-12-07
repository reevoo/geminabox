require 'rubygems'
require 'geminabox'

Geminabox.data = "/mnt/geminabox"
Geminabox.rubygems_proxy = true
Geminabox.allow_remote_failure = true
Geminabox.build_legacy = false
run Geminabox::Server
