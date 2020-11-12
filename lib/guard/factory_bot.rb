# frozen_string_literal: true

require_relative 'command_plugin'

module Guard
  class FactoryBot < CommandPlugin
    def command(_paths)
      %w[bin/rails runner --environment=test] +
        ['ApplicationRecord.transaction { FactoryBot.lint; raise ActiveRecord::Rollback }']
    end
  end
end
