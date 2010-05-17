require 'spec'
require 'isolated/require_spec'
require 'dm-core/spec/setup'
require 'dm-core/spec/lib/adapter_helpers'

# To really test this behavior, this spec needs to be run in isolation and not
# as part of the typical rake spec run, which requires dm-transactions upfront

describe "require 'dm-transactions after calling DataMapper.setup" do
  extend DataMapper::Spec::Adapters::Helpers

  before(:all) do
    @adapter = DataMapper::Spec.adapter
    require 'dm-transactions'
  end

  supported_by :postgres, :mysql, :sqlite, :oracle, :sqlserver do
    it_should_behave_like "require 'dm-transactions'"
  end

end
