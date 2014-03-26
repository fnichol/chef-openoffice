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

unless File.directory?('/var/chef/cache/openoffice/en-US')
  tar_extract node[:openoffice][:rpm_url] do
    target_dir '/var/chef/cache/openoffice'
  end
end

execute 'install-openoffice-rpms' do
  command 'yum install -y /var/chef/cache/openoffice/en-US/RPMS/*.rpm /var/chef/cache/openoffice/en-US/RPMS/desktop-integration/openoffice4.0-redhat-*.rpm'
  not_if 'rpm -q openoffice'
end

