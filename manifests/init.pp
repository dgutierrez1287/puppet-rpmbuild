# Class: rpmbuild
#
# This module manages the creation and setup for an environment to build RPMs.
# This will install the basic needed packages to build RPMs and will have 
# macros to setup the build environment for each user needed
#
# Parameters: 
# rpmbuild_packages - An array of packages that are needed to build rpms
# optional_packages - Any additional packages that need to be install 
#
# Actions: Installs needed packages to build RPMs and configures the build 
# environment for each user that is needed 
#
# Requires: see Modulefile
#
#
class rpmbuild {
  
  # install packages...
  # yes. this is all kinds of fugly. however, without the 'if !defined(Package...' package definitions will conflict
  # definitions in other modules

  # required packages 
  if !defined(Package['make']) {
    package { 'make':
      ensure  => installed,
    }
  }

  if !defined(Package['automake']) {
    package { 'automake':
      ensure  => installed,
    }
  }

  if !defined(Package['autoconf']) {
    package { 'autoconf':
      ensure  => installed,
    }
  }

  if !defined(Package['gcc']) {
    package { 'gcc':
      ensure  => installed,
    }
  }

  if !defined(Package['gcc-c++']) {
    package { 'gcc-c++':
      ensure  => installed,
    }
  }

  if !defined(Package['rpm-build']) {
    package { 'rpm-build':
      ensure  => installed,
    }
  }

  if !defined(Package['redhat-rpm-config']) {
    package { 'redhat-rpm-config':
      ensure  => installed,
    }
  }

  if !defined(Package['rpmdevtools']) {
    package { 'rpmdevtools':
      ensure  => installed,
    }
  }

  if !defined(Package['yum']) {
    package { 'yum':
      ensure  => installed,
    }
  }

  if !defined(Package['yum-utils']) {
    package { 'yum-utils':
      ensure  => installed,
    }
  }

  if !defined(Package['createrepo']) {
    package { 'createrepo':
      ensure  => installed,
    }
  }

  if !defined(Package['gnupg2']) {
    package { 'gnupg2':
      ensure  => installed,
    }
  }
  
  if !defined(Package['rpmlint']) {
    package { 'rpmlint' :
      ensure => installed,
    }
  }

  if !defined(Package['mock']) {
      package { 'mock' :
          ensure => installed
      }
  }


  # if there are optional packages provided install them to the latest version
  # for example...
  #if !defined(Package['gcc'] {
  #  package { 'gcc':
  #    ensure  => installed,
  #  }
  #}

  # if the operating system is fedora install the extra packages
  if $operatingsystem == 'Fedora' {
    
    # install fedora-packager to the latest version
    package { 'fedora-packager':
      ensure => latest,
    }
    
    # install rpm-sign to the latest version
    package { 'rpm-sign':
      ensure => latest,
    }
  }
}
