# frozen_string_literal: true

require_relative 'command_plugin'

module Guard
  class Jest < CommandPlugin
    def command(paths)
      %w[yarn jest] + paths
    end
  end
end
