# frozen_string_literal: true

Dir["#{__dir__}/lib/guard/*.rb"].sort.each { |guard_plugin| require guard_plugin }

group :tdd, halt_on_fail: true do
  guard :bundler do
    watch('Gemfile')
  end

  guard :yarn do
    watch('package.json')
  end

  guard :webpacker do
    watch('config/webpacker.yml')
    watch(%r{^config/webpacker/(.+)$})
  end

  guard :test_database, run_on_start: true do
    watch('db/schema.rb')
    watch('db/seeds/orphan_adopters.rb')
  end

  guard :factory_bot do
    watch(%r{(?:(?:test|spec)/)?factories.rb})
    watch(%r{(?:(?:test|spec)/)?factories/*.rb})
  end

  guard :jest do
    watch(%r{app/javascript/.+/__tests__/.+\.spec\.js\z})
    watch(%r{(app/javascript/.*)/([^/.]+)\.(?:vue|ts|js)\z}) do |m|
      "#{m[1]}/__tests__/#{m[2]}.spec.js"
    end
  end

  rspec_opts = {
    cmd:            'bundle exec rspec',
    all_on_start:   false,
    all_after_pass: false,
    failed_mode:    :keep
  }

  guard :rspec, rspec_opts do
    require 'guard/rspec/dsl'
    dsl = Guard::RSpec::Dsl.new(self)

    # RSpec files
    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec_dir }
    watch(rspec.spec_files)

    # Ruby files
    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files)

    # Rails files
    rails = dsl.rails(view_extensions: %w[erb haml slim])
    dsl.watch_spec_files_for(rails.app_files)
    dsl.watch_spec_files_for(rails.views)

    watch(rails.controllers) do |m|
      [
        rspec.spec.call("routing/#{m[1]}_routing"),
        rspec.spec.call("controllers/#{m[1]}_controller"),
        rspec.spec.call("acceptance/#{m[1]}")
      ]
    end

    # Rails config changes
    watch(rails.spec_helper)     { rspec.spec_dir }
    watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
    watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

    # Capybara features specs
    watch(rails.view_dirs)     { |m| rspec.spec.call("features/#{m[1]}") }
    watch(rails.layouts)       { |m| rspec.spec.call("features/#{m[1]}") }

    # Turnip features and steps
    watch(%r{^spec/acceptance/(.+)\.feature$})
    watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
      Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance'
    end
  end

  guard :traceroute do
    watch('.traceroute.yaml')
    watch('config/routes.rb')
    watch(%r{app/controllers/.+})
  end

  guard :rubocop, all_on_start: false, cli: '--display-cop-names' do
    watch(/.+\.rb$/)
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
  end

  guard :yarn_audit do
    watch('yarn.lock')
  end

  guard :bundle_audit, ignore: %w[CVE-2015-9284] do
    watch('Gemfile.lock')
  end

  guard :bundle_leak do
    watch('Gemfile.lock')
  end

  guard :brakeman do
    watch(%r{^app/.+\.(erb|haml|rhtml|rb)$})
    watch(%r{^config/.+\.rb$})
    watch(%r{^lib/.+\.rb$})
    watch('Gemfile.lock')
  end
end
