require 'byebug'
require 'beefy_robot_simulator'

RSpec.configure do |config|
  # rspec-expectations config
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.default_formatter = 'doc' if config.files_to_run.one?
  config.disable_monkey_patching!
  config.filter_run :focus
  config.order = :random
  config.profile_examples = 10
  config.run_all_when_everything_filtered = true
  config.warnings = true

  Kernel.srand config.seed
end
