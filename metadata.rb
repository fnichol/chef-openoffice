maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Installs the OpenOffice productivity suite."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.0"

recipe "openoffice",            "Default, empty recipe"
recipe "openoffice::headless",  "Installs the headless (no X) core of OpenOffice."
recipe "openoffice::apps",      "Installs the application components for OpenOffice, namely Writer, Calc, and Impress."

supports "ubuntu"

depends "java"
