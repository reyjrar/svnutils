define subversion::repo(
	$owner = 'root',
	$group = 'svnusers',
	$rootdir = '/repo'
) {
	group { $group:
		ensure => present
	}
	file { $rootdir:
		ensure => directory,
		owner => root, mode => 755
	}
	exec { "svn-repo-$name":
		command	=> "/usr/bin/svnadmin create $rootdir/$name",
		creates => "$rootdir/$name",
		require => [
			File[$rootdir], Class[subversion]
		],
	}
	file { "$rootdir/$name":
		ensure => present,
		mode => 0775,
		owner => $owner,
		group => $group,
		recurse => true,
		require => Exec["svn-repo-$name"]
	}
}

