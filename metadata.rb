maintainer       "Peter Donald"
maintainer_email "peter@realityforge.org"
license          "Apache 2.0"
description      "Installs/Configures GlassFish Application Server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.41"

recipe "glassfish::default", "Installs and configures GlassFish"
recipe "glassfish::attribute_driven_domain", "Installs GlassFish domains defined in the glassfish/domains attribute"
recipe "glassfish::attribute_driven_mq", "Installs GlassFish OpenMQ brokers defined in the openmq/instances attribute"

depends 'java'
depends 'authbind'

attribute "glassfish/user",
  :display_name => "GlassFish User",
  :description => "The user that GlassFish executes as",
  :type => "string",
  :default => "glassfish"

attribute "glassfish/group",
  :display_name => "GlassFish Admin Group",
  :description => "The group allowed to manage GlassFish domains",
  :type => "string",
  :default => "glassfish-admin"

attribute "glassfish/package_url",
  :display_name => "URL for GlassFish Package",
  :description => "The url to the GlassFish install package",
  :type => "string",
  :default => "http://dlc.sun.com.edgesuite.net/glassfish/3.1.1/release/glassfish-3.1.1.zip"

attribute "glassfish/package_checksum",
  :display_name => "Checksum for the GlassFish Package",
  :description => "The SHA1 checksum for the GlassFish install package",
  :type => "string",
  :default => "8bf4dc016d602e96911456b2e34098b86bae61e2"

attribute "glassfish/base_dir",
  :display_name => "GlassFish Base Directory",
  :description => "The base directory of the GlassFish install",
  :type => "string",
  :default => "/usr/local/glassfish3"

attribute "glassfish/domains_dir",
  :display_name => "GlassFish Domain Directory",
  :description => "The directory containing all the domain definitions",
  :type => "string",
  :default => "/usr/local/glassfish3/glassfish/domains"

attribute "glassfish/domain_definitions",
  :display_name => "GlassFish Domain Definitions",
  :description => "A map of domain defitions that drive the instantiation of a domain",
attribute "openmq/instances",
  :display_name => "GlassFish OpenMQ Broker Definitions",
  :description => "A map of broker definitions that drive the instantiation of a OpenMQ broker",
  :type => "hash",
  :default => {}

attribute "openmq/extra_libraries",
  :display_name => "Extract libraries for the OpenMQ Broker",
  :description => "A list of URLs to jars that are added to brokers classpath",
  :type => "hash",
  :default => {}
