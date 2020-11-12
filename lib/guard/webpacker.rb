# frozen_string_literal: true

require 'guard/compat/plugin'

module Guard
  class Webpacker < Plugin
    def start
      command = 'bin/webpack-dev-server'
      info "Starting `#{command}`..."
      @pid = spawn({ 'RAILS_ENV' => 'test' }, command)
    end

    def stop
      return unless @pid

      info 'Stopping ...'
      ::Process.kill :TERM, @pid
      Timeout.timeout(15) { ::Process.wait @pid }
    rescue Timeout::Error
      info "didn't stop; killing ..."
      ::Process.kill :KILL, @pid
      ::Process.wait @pid
    ensure
      @pid = nil
      info 'Stopped'
    end

    def run_all
      true
    end

    def run_on_modifications(_paths)
      restart
    end

    def restart
      stop
      start
    end

    private

    def info(msg)
      Guard::Compat::UI.info "[#{self.class.name}] #{msg}"
    end
  end
end
