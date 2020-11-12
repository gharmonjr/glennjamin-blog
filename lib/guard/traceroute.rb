# frozen_string_literal: true

require_relative 'command_plugin'

module Guard
  class Traceroute < CommandPlugin
    def command(_path)
      [{ 'FAIL_ON_ERROR' => 1 }, 'bin/rake', 'traceroute']
    end
  end
end
