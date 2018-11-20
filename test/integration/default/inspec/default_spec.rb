describe package('apt-transport-https') do
  it { should be_installed }
end

describe package('curl') do
  it { should be_installed }
end

describe package('debian-archive-keyring') do
  it { should be_installed }
end

describe file('/etc/apt/sources.list.d/capotej_apt-cacher-ng.list') do
  it { should be_file }
end

describe command('apt-key list') do
   its('stdout') { should include ("capotej/apt-cacher-ng") }
end
