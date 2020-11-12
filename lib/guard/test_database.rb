# frozen_string_literal: true

require_relative 'command_plugin'

module Guard
  class TestDatabase < CommandPlugin
    def command(_paths)
      [
        { 'RAILS_ENV' => 'test' },
        'bin/rails',
        'db:drop',
        'db:create',
        'db:schema:load',
        'db:seed:orphan_adopters'
      ]
    end
  end
end
