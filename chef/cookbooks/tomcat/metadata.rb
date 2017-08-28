name 'tomcat'
maintainer 'IBM Corp'
maintainer_email ''
license 'Copyright IBM Corp. 2017, 2017'
description 'This cookbook installs and configures Apache Tomcat.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.29'
depends 'ibm_cloud_utils'
description <<-EOH
## DESCRIPTION
This cookbook installs and configures Apache Tomcat.

## Platforms Support
* Red Hat Enterprise Linux 7
* Red Hat Enterprise Linux 6
* Ubuntu 16.04 LTS
* Ubuntu 14.04 LTS

## Versions
* Apache Tomcat 8.0.x
* Apache Tomcat 8.5.x

## Use Cases
* Basic install, no SSL, no users
* Install with SSL support, admin user

## Platform Pre-Requisites
* Linux YUM Repository - An onsite linux YUM Repsoitory is required.

## Softare Package Repository
REPO -> Stored in the ['ibm']['sw_repo'] attribute.
EOH



supports "RHEL6", ">= 6.5"
supports "RHEL7"
supports "ubuntu", ">= 14.04"

attribute 'tomcat/ajp/port',
          :default => '8009',
          :description => 'Specifies the AJP port to be configured in Tomcat.',
          :displayname => 'Tomcat AJP port',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/http/port',
          :default => '8080',
          :description => 'The Tomcat port to service HTTP requests.',
          :displayname => 'Tomcat HTTP port',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/install_dir',
          :default => '/opt/tomcat',
          :description => 'Specifies the directory to install Tomcat.',
          :displayname => 'Tomcat install directory',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/instance_dirs/conf_dir',
          :default => '/opt/tomcat/conf',
          :description => 'Specifies the directory for Tomcat configuration data.',
          :displayname => 'Tomcat conf directory',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/instance_dirs/log_dir',
          :default => '/opt/tomcat/logs',
          :description => 'Specifies the directory for Tomcat log files.',
          :displayname => 'Tomcat logs directory',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/instance_dirs/temp_dir',
          :default => '/opt/tomcat/temp',
          :description => 'Specifies the temporary directory for Tomcat.',
          :displayname => 'Tomcat temp directory',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/instance_dirs/webapps_dir',
          :default => '/opt/tomcat/webapps',
          :description => 'Specifies the Tomcat directory for web applications.',
          :displayname => 'Tomcat webapps directory',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/instance_dirs/work_dir',
          :default => '/opt/tomcat/work',
          :description => 'Specifies the Tomcat working directory.',
          :displayname => 'Tomcat work directory',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/java/catalina_opts',
          :default => 'true',
          :description => 'Specifies additional options on the java command used to start Tomcat.',
          :displayname => 'Tomcat catalina_opts',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :type => 'string'
attribute 'tomcat/java/java_opts',
          :default => 'true',
          :description => 'Specifies additional options for commands to start, stop and more on Tomcat.',
          :displayname => 'Tomcat java_opts',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :type => 'string'
attribute 'tomcat/java/java_sdk',
          :default => 'false',
          :description => 'Specifies the use of a Java Development Kit or Runtime Environment.',
          :displayname => 'Tomcat java_flavor',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/java/vendor',
          :default => 'openjdk',
          :description => 'Currently only openjdk is supported as the Tomcat java vendor.',
          :displayname => 'Tomcat java vendor',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/java/version',
          :default => '1.8.0',
          :description => 'The version of Java to be used for Tomcat.',
          :displayname => 'Tomcat java version',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/os_users/daemon/comment',
          :default => 'tomcat daemon user',
          :description => 'Specifies a login comment for the Tomcat daemon user.',
          :displayname => 'Tomcat daemon user comment',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/os_users/daemon/gid',
          :default => 'tomcat',
          :description => 'Specifies the name of the Operating System group for Tomcat daemon users.',
          :displayname => 'Tomcat daemon user group',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/os_users/daemon/home',
          :default => '/home/tomcat',
          :description => 'Specifies the home directory of the Tomcat daemon user.',
          :displayname => 'Tomcat daemon user home directory',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/os_users/daemon/ldap_user',
          :default => 'false',
          :description => 'Specifies whether the Tomcat daemon user is stored in LDAP.',
          :displayname => 'Tomcat daemon user ldap',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/os_users/daemon/name',
          :default => 'tomcat',
          :description => 'Specifies the user for the Tomcat daemon.',
          :displayname => 'Tomcat daemon user',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/os_users/daemon/shell',
          :default => '/sbin/nologin',
          :description => 'The Tomcat daemon Unix shell.',
          :displayname => 'Tomcat daemon shell',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/server/manage',
          :default => 'false',
          :description => 'Specifies whether the tomcat server.xml is managed by CHEF or allows for manually modifications.',
          :displayname => 'Tomcat CHEF managed server.xml',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/server/port',
          :default => '8005',
          :description => 'Specifies the server port to be configured in Tomcat.',
          :displayname => 'Tomcat server port',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/server/shutdown_cmd',
          :default => 'SHUTDOWN',
          :description => 'Specifies the command to be used to shutdown Tomcat.',
          :displayname => 'Tomcat shutdown command',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/service/enabled',
          :default => 'true',
          :description => 'Specifies whether the Tomcat service will be started automatically on server reboot.',
          :displayname => 'Tomcat service enabled',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/service/name',
          :default => 'tomcat',
          :description => 'Specifies the Tomcat service name.',
          :displayname => 'Tomcat service name',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/service/started',
          :default => 'true',
          :description => 'Specifies the desired Tomcat service state.',
          :displayname => 'Tomcat service state',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/cert/alias',
          :default => 'tomcat',
          :description => 'Tomcat SSL certificate alias for identification in the keystore',
          :displayname => 'Tomcat SSL certificate alias',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/cert/c',
          :default => 'US',
          :description => 'Tomcat SSL certificate country',
          :displayname => 'Tomcat SSL certificate country',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/cert/cn',
          :default => 'default',
          :description => 'Tomcat SSL certificate common name',
          :displayname => 'Tomcat SSL certificate common name',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/cert/l',
          :default => 'Rochester',
          :description => 'Tomcat SSL certificate location',
          :displayname => 'Tomcat SSL certificate location',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/cert/o',
          :default => 'Company',
          :description => 'Tomcat SSL certificate organization',
          :displayname => 'Tomcat SSL certificate organization',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/cert/ou',
          :default => 'Org',
          :description => 'Tomcat SSL certificate organizational unit',
          :displayname => 'Tomcat SSL certificate organizational unit',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/cert/s',
          :default => 'MN',
          :description => 'Tomcat SSL certificate state',
          :displayname => 'Tomcat SSL certificate state',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/cert/validity',
          :default => '3650',
          :description => 'Tomcat SSL certificate validity period',
          :displayname => 'Tomcat SSL certificate validity',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/enabled',
          :default => 'true',
          :description => 'Indicates whether to enable the Tomcat SSL connector.',
          :displayname => 'Tomcat SSL enabled',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/keystore/alg',
          :default => 'RSA',
          :description => 'The RSA algorithm should be preferred as a secure algorithm.',
          :displayname => 'Tomcat SSL keystore algorithm',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/keystore/file',
          :default => '/opt/tomcat/conf/keystore.jks',
          :description => 'Path to the Tomcat SSL Keystore file.',
          :displayname => 'Tomcat SSL keystore file',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/keystore/password',
          :default => '',
          :description => 'The keystore password used in Tomcat for SSL configuration.',
          :displayname => 'Tomcat SSL keystore password',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'true',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/keystore/type',
          :default => 'JKS',
          :description => 'Specifies the keystore type for which Tomcat supports JKS, PKCS11 or PKCS12 formats.',
          :displayname => 'Tomcat SSL keystore type',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/options/ciphers',
          :default => 'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_RC4_128_SHA,TLS_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA256,TLS_RSA_WITH_AES_256_CBC_SHA,SSL_RSA_WITH_RC4_128_SHA',
          :description => 'Tomcat SSL options ciphers',
          :displayname => 'Tomcat SSL options ciphers',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/options/max_threads',
          :default => '200',
          :description => 'Tomcat SSL options max threads',
          :displayname => 'Tomcat SSL options max threads',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/options/protocol',
          :default => 'TLS',
          :description => 'Tomcat SSL options protocol',
          :displayname => 'Tomcat SSL options protocol',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ssl/port',
          :default => '8443',
          :description => 'Tomcat port for SSL communication',
          :displayname => 'Tomcat SSL port',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/all_roles/admin-gui',
          :default => 'enabled',
          :description => 'Tomcat roles: admin-gui',
          :displayname => 'Tomcat roles: admin-gui',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/all_roles/manager-gui',
          :default => 'enabled',
          :description => 'Tomcat roles: manager-gui',
          :displayname => 'Tomcat roles: manager-gui',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/all_roles/manager-jmx',
          :default => 'enabled',
          :description => 'Tomcat roles: manager-jmx',
          :displayname => 'Tomcat roles: manager-jmx',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/all_roles/manager-script',
          :default => 'enabled',
          :description => 'Tomcat roles: manager-script',
          :displayname => 'Tomcat roles: manager-script',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/all_roles/manager-status',
          :default => 'enabled',
          :description => 'Tomcat roles: manager-status',
          :displayname => 'Tomcat roles: manager-status',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/users/administrator/name',
          :default => 'admin',
          :description => 'Name of the admin user to be configured in Tomcat.',
          :displayname => 'Tomcat admin username',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/users/administrator/password',
          :default => '',
          :description => 'Password of the admin user to be configured in Tomcat.',
          :displayname => 'Tomcat admin user password',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'true',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/users/administrator/status',
          :default => 'enabled',
          :description => 'Specifies whether to enable the admin user in the Tomcat configuration.',
          :displayname => 'Tomcat admin status',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/users/administrator/user_roles/admin-gui',
          :default => 'enabled',
          :description => 'Tomcat users administrator roles: admin-gui',
          :displayname => 'Tomcat users administrator roles: admin-gui',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/users/administrator/user_roles/manager-gui',
          :default => 'enabled',
          :description => 'Tomcat users administrator roles: manager-gui',
          :displayname => 'Tomcat users administrator roles: manager-gui',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/users/administrator/user_roles/manager-jmx',
          :default => 'enabled',
          :description => 'Tomcat users administrator roles: manager-jmx',
          :displayname => 'Tomcat users administrator roles: manager-jmx',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/users/administrator/user_roles/manager-script',
          :default => 'enabled',
          :description => 'Tomcat users administrator roles: manager-script',
          :displayname => 'Tomcat users administrator roles: manager-script',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/ui_control/users/administrator/user_roles/manager-status',
          :default => 'enabled',
          :description => 'Tomcat users administrator roles: manager-status',
          :displayname => 'Tomcat users administrator roles: manager-status',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/version',
          :default => '',
          :description => 'The version of Tomcat to be installed.',
          :displayname => 'Tomcat install version',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/webapps/enabled/ROOT',
          :default => 'true',
          :description => 'Tomcat webapp ROOT',
          :displayname => 'Tomcat webapp ROOT',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/webapps/enabled/docs',
          :default => 'true',
          :description => 'Specifies whether to install the Tomcat webapp examples documentation.',
          :displayname => 'Tomcat webapp docs',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/webapps/enabled/examples',
          :default => 'true',
          :description => 'Specifies whether to install the Tomcat webapp examples.',
          :displayname => 'Tomcat webapp examples',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/webapps/enabled/host-manager',
          :default => 'true',
          :description => 'Specifies whether to install the Tomcat host-manager webapp.',
          :displayname => 'Tomcat webapp host-manager',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'tomcat/webapps/enabled/manager',
          :default => 'true',
          :description => 'Specifies whether to install the Tomcat manager webapp.',
          :displayname => 'Tomcat webapp manager',
          :parm_type => 'none',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
recipe 'tomcat::cleanup.rb', '
Cleanup recipe (cleanup.rb)
Perform post-install cleanup
'
recipe 'tomcat::configure_tomcat_init.rb', '
Create init script (configure_tomcat_init.rb)
Create init script.
'
recipe 'tomcat::configure_tomcat_server.rb', '
Configure tomcat server recipe (configure_tomcat_server.rb)
Setup the main server configuration file
'
recipe 'tomcat::configure_tomcat_users.rb', '
'
recipe 'tomcat::default.rb', '
Default recipe (default.rb)
Include recipes for a standard installation
'
recipe 'tomcat::gather_evidence.rb', '
Gather evidence recipe (gather_evidence.rb)
Gather evidence that installation was successful
'
recipe 'tomcat::install.rb', '
Installation recipe (install.rb)
Perform an installation of selected tomcat package on the target node.
'
recipe 'tomcat::prereq.rb', '
Prerequisites recipe (prereq.rb)
Perform prerequisite tasks.
'
recipe 'tomcat::prereq_check.rb', '
Prerequisites recipe (prereq_check.rb)
Verify required prerequisites, validate input
'
recipe 'tomcat::service.rb', '
Service setup recipe (service.rb)
Configure tomcat service
'
