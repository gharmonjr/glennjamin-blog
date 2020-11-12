# frozen_string_literal: true

require_relative 'command_plugin'

module Guard
  class YarnAudit < CommandPlugin
    def command(_paths)
      %w[yarn run improved-yarn-audit --min-severity moderate --retry-on-network-failure]
    end
  end
end
