#
# Subversion Management Module
import "defines/*.pp"

class subversion {
	package {
		[ 'subversion', 'subversion-devel', 'subversion-perl', 'subversion-ruby' ]:
		ensure => installed
	}

	file { '/opt/local/bin/svntag':
		mode => 0755, owner => root, 
		source => 'puppet:///subversion/svntag',
		require => Package['subversion']
	}

	file { "/usr/bin/svntag":
		ensure => "/opt/local/bin/svntag",
		require => File['/opt/local/bin/svntag']
	}

	file { '/opt/local/sbin/svncheckrel':
		mode => 0755, owner => root, 
		source => 'puppet:///subversion/svncheckrel',
		require => Package['subversion']
	}

	file { '/opt/local/sbin/svnexportrel':
		mode => 0755, owner => root, 
		source => 'puppet:///subversion/svnexportrel',
		require => Package['subversion']
	}


}

