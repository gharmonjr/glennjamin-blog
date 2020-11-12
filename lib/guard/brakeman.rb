# frozen_string_literal: true

require_relative 'command_plugin'

module Guard
  class Brakeman < CommandPlugin
    def command(_paths)
      %w[brakeman --no-pager --no-summary --quiet]
    end
  end
end
