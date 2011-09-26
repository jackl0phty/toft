Feature: Checkers provided by Toft to help you verify system state

Scenario: Dir checker
	Given I have a clean running node "n1" with ip "192.168.20.2"
	Then Node "n1" should have "directory" "/tmp" owned by user "root" and group "root" with permission "1777"
	Then Node "n1" should have not file or directory "/non-exist-dir"
	Then Node "n1" should have file or directory "tmp"
	Then Node "n1" should have file or directory "~"
	
Scenario: File checker
	Given I have a clean running node "n1" with ip "192.168.20.2"
	When Running ssh command "if getent passwd n1; then userdel n1; fi; useradd n1" on "n1" should succeed
	And Running ssh command "sudo -u n1 touch /tmp/a" on "n1" should succeed
	Then Node "n1" should have file or directory "/tmp/a"
	And Node "n1" should have "regular empty file" "/tmp/a" owned by user "n1" and group "n1" with permission "644"	