class zabbix_iostat {

  package { 'sysstat':
    ensure  => latest,
  }

    file {
	['/etc/zabbix/externalscripts/']:
        ensure => 'directory'
    }


  file{ '/etc/zabbix/externalscripts/iostat-collect.sh':
    ensure  => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
    source => 'puppet:///modules/zabbix_iostat/iostat-collect.sh',
  }


  file{ '/etc/zabbix/externalscripts/iostat-parse.sh':
    ensure  => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
    source => 'puppet:///modules/zabbix_iostat/iostat-parse.sh',
  }


  file{ '/etc/zabbix/zabbix_agentd.d/iostat.conf':
    notify  => Service['zabbix-agent'],  # this sets up the relationship
    owner  => 'root',
    group  => 'root',
    mode   => 0644,
    source => 'puppet:///modules/zabbix_iostat/iostat.conf',
  }




}

