#File: Rakefile
#Usage: rake

#Define tasks
desc "Clean temp files."
task :clean do
	system("rm -rf var/tmp/*")
end

desc "Debian full installation"
task :debian => [:debpackages, :rubygems, :auxdirs]

desc "Install Debian packages "
task :debpackages do
	system("apt-get install -y nmap ssh")
end

desc "OpenSUSE full installation"
task :suse => [:zypperpackages, :rubygems, :auxdirs]

desc "Install OpenSuse packages"
task :zypperpackages do
	system("zypper --non-interactive in --auto-agree-with-licenses nmap openssh")
end

desc "Install rubygems"
task :rubygems do
	system("gem install net-ssh net-sftp rspec")
end

desc "Creating auxiliar directories"
task :auxdirs do
	system("chmod +x check/demos/*.rb")
	system("mkdir -p var/mnt")
	system("mkdir -p var/out")
	system("mkdir -p var/tmp")
end
