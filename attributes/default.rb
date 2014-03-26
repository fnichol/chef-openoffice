case node['platform_family']
  when 'rhel'
    default[:openoffice][:install_method] = 'rpms'
  else
    default[:openoffice][:install_method] = 'package'
end

default[:openoffice][:rpm_url] = 'http://sourceforge.net/projects/openofficeorg.mirror/files/4.0.1/binaries/en-US/Apache_OpenOffice_4.0.1_Linux_x86-64_install-rpm_en-US.tar.gz/download'
