define subversion::deploy (
	$svnurl,
	$target,
	$owner = 'apache',
	$group = 'apache'
) {
	exec { "svndeploy-$name":
		onlyif => "/opt/local/sbin/svncheckrel $svnurl $target",
		command => "/opt/local/sbin/svnexportrel $svnurl $target",
	}

	file { $target:
		ensure => directory,
		owner => $owner, group => $group,
		require => Exec["svndeploy-$name"]
	}
}
