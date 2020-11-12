# frozen_string_literal: true

require_relative 'command_plugin'

module Guard
  class BundleAudit < CommandPlugin
    def initialize(options = {})
      @command = %w[bundle-audit check --update]
      (options.delete(:ignore) || []).each do |cve|
        @command << '--ignore' << cve
      end
      super(options)
    end
  end
end
