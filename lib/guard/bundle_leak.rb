# frozen_string_literal: true

require_relative 'command_plugin'

module Guard
  class BundleLeak < CommandPlugin
    def command(_paths)
      %w[bundle leak check --update]
    end
  end
end
