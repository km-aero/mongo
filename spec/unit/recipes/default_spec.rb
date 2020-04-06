#
# Cookbook:: mongo
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongo::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'updates packages' do
      expect(chef_run).to periodic_apt_update('all platforms')
    end

    it 'should be in source list' do
      expect{ is_expected.to render_file('/etc/apt/sources.list').with_content("mongo") }
    end

    it 'installs MongoDB' do
      expect(chef_run).to install_package 'mongodb'
    end

    it 'shows starting MongoDB' do
      expect(chef_run).to start_service 'mongodb'
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
