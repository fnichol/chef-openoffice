#
# Cookbook Name:: openoffice
# Attributes:: headless
#
# Copyright 2010, Fletcher Nichol
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

case platform
when "ubuntu"
  if node['platform_version'].to_f <= 10.04
    node.set['openoffice']['headless_pkgs'] =
      %w{openoffice.org-core openoffice.org-java-common}
  else
    node.set['openoffice']['headless_pkgs'] =
      %w{libreoffice-core libreoffice-java-common}
  end
else
  node.set['openoffice']['headless_pkgs'] = []
end
