maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Installs/Configures openoffice"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

recipe "openoffice", "Default, empty recipe"
recipe "openoffice::headless", "Headless install of OpenOffice"

%w{ ubuntu }.each do |os|
  supports os
end
