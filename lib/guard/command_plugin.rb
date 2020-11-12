# frozen_string_literal: true

require 'guard/compat/plugin'
require 'English'

module Guard
  class CommandPlugin < Plugin
    def initialize(options = {})
      @run_on_start = options.delete(:run_on_start)
      super(options)
    end

    def start
      run_command if @run_on_start
    end

    def run_all
      run_command
    end

    def run_on_additions(paths)
      run_command(paths)
    end

    def run_on_modifications(paths)
      run_command(paths)
    end

    private

    def command(_paths)
      @command
    end

    def run_command(paths = [])
      Guard::Compat::UI.info "[#{self.class.name}] Running ..."
      system(*command(paths))
      $CHILD_STATUS.success?
    end
  end
end
