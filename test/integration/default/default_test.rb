# InSpec test for recipe mongo::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe service 'mongodb' do
  it { should be_running }
  it { should be_enabled }
end

describe package('mongodb') do
  its('version') { should cmp '1:3.6.3-0ubuntu1' }
end

describe port(27017) do
  it { should be_listening }
end
