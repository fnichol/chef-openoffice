#
# Cookbook Name:: openoffice
# Recipe:: install_from_rpms
#
# Copyright 2014, Eric Tucker
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

directory '/var/chef/cache/openoffice' do
  recursive true
end

#Can't use remote_file due to redirect limits on the resource that can't be overridden
execute 'download-openoffice-tar' do
  command 'wget ' + node[:openoffice][:rpm_url] + ' -O /var/chef/cache/openoffice/Apache_OpenOffice_RPM-US.tar.gz'
  not_if 'ls /var/chef/cache/openoffice/Apache_OpenOffice_RPM-US.tar.gz &>/dev/null'
end

execute 'extract-openoffice-tar' do
  command 'tar xf /var/chef/cache/openoffice/Apache_OpenOffice_RPM-US.tar.gz -C /var/chef/cache/openoffice'
  not_if 'ls /var/chef/cache/openoffice/en-US &>/dev/null'
end

execute 'install-openoffice-rpms' do
  command 'yum install -y /var/chef/cache/openoffice/en-US/RPMS/*.rpm /var/chef/cache/openoffice/en-US/RPMS/desktop-integration/openoffice4.0-redhat-*.rpm'
  not_if 'rpm -q openoffice'
end

