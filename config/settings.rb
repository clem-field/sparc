# frozen_string_literal: true

require "settingslogic"

# Load settings that are used globally throughout the application.
# This will load settings from a file in order to allow the most flexability
# across deployment types. Since SettingsLogic does ERB parsing, it also
# is able to load some basic settings using environment variables.
# For a full list of settings that can be applied using environment
# variables, check sparc.default.yml.
#
# Note, if a sparc.yml, environment variable parsing
# will no longer work unless you include the `ENV` declarations in
# your copy of sparc.yml as well.
#
class Settings < Settingslogic
  class << self
    def find_config
      # There are 2 locations that we check for config files,
      # either we check the default location or we check if
      # the user has created a vulcan.yml
      [ "sparc.yml", "sparc.default.yml" ].each do |config|
        path = get_full_path_for(config)
        return path if path.exist?
      end

      nil # Neither config file exists, this should never happen
    end

    def get_full_path_for(config_file)
      Pathname.new(File.expand_path("..", __dir__)).join("config/#{config_file}")
    end
  end

  source ENV.fetch("SPARC_CONFIG") { find_config }
  namespace ENV.fetch("SPARC_ENV") { Rails.env }
end
