# InSpec test for recipe mongo::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

describe service 'mongodb' do
  it { should be_running }
  it { should be_enabled }
end

# This is an example test, replace it with your own test.
describe port(27017), :skip do
  it { should be_listening }
end
