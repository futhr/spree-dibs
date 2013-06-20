require 'yaml'

raw_config = File.read('spec/support/config.yml')
DIBS_CONFIG = YAML.load(raw_config)['dibs']
