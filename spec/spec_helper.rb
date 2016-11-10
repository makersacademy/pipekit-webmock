$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "pipekit/webmock"

# Dummy config data
Pipekit.config_file_path = File.join(File.dirname(__FILE__), "support", "config.yml")
