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

directory "#{Chef::Config[:file_cache_path]}/openoffice" do
  recursive true
end

tar_extract node['openoffice']['rpm_url'] do
  target_dir "#{Chef::Config[:file_cache_path]}/openoffice"
  not_if { File.directory?("#{Chef::Config[:file_cache_path]}/openoffice/en-US") }
end

execute 'install-openoffice-rpms' do
  command "yum install -y #{Chef::Config[:file_cache_path]}/openoffice/en-US/RPMS/*.rpm /var/chef/cache/openoffice/en-US/RPMS/desktop-integration/openoffice4.0-redhat-*.rpm"
  not_if 'rpm -q openoffice'
end
