# Encoding: UTF-8

require_relative '../spec_helper'

describe 'Chef-DK package' do
  describe package('chefdk') do
    it 'is installed with the right version' do
      expect(subject).to be_installed.with_version('0.3.4-1')
    end
  end

  describe command('/opt/chef/embedded/bin/gem list omnijack') do
    it 'does not list Omnijack as installed' do
      expect(subject.stdout).not_to match(/^omnijack /)
    end
  end
end
