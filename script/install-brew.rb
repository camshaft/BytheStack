#!/usr/bin/ruby
# This script installs to /srv/local only. To install elsewhere you can just
# untar https://github.com/mxcl/homebrew/tarball/master anywhere you like.

module Tty extend self
    def blue; bold 34; end
    def white; bold 39; end
    def red; underline 31; end
    def reset; escape 0; end
    def bold n; escape "1;#{n}" end
    def underline n; escape "4;#{n}" end
    def escape n; "\033[#{n}m" if STDOUT.tty? end
end

class Array
    def shell_s
        cp = dup
        first = cp.shift
        cp.map{ |arg| arg.gsub " ", "\\ " }.unshift(first) * " "
    end
end

def ohai *args
    puts "#{Tty.blue}==>#{Tty.white} #{args.shell_s}#{Tty.reset}"
end

def warn warning
    puts "#{Tty.red}Warning#{Tty.reset}: #{warning.chomp}"
end

def system *args
    abort "Failed during: #{args.shell_s}" unless Kernel.system *args
end

def sudo *args
    args = if args.length > 1
    args.unshift ""
    else
    "#{args.first}"
end
ohai *args
system *args
end

def getc  # NOTE only tested on OS X
    system "/bin/stty raw -echo"
    if RUBY_VERSION >= '1.8.7'
        STDIN.getbyte
        else
        STDIN.getc
    end
    ensure
    system "/bin/stty -raw echo"
end

def badlibs
    @badlibs ||= begin
        Dir['/srv/local/lib/*.dylib'].select do |dylib|
            ENV['dylib'] = dylib
            File.file? dylib and not File.symlink? dylib and `/srv/bin/file "$dylib"` =~ /shared library/
        end
    end
end

####################################################################### script
abort "/srv/local/.git already exists!" unless Dir["/srv/local/.git/*"].empty?
abort "Don't run this as root!" if Process.uid == 0
abort <<-EOABORT unless `groups`.split.include? "staff"
This script requires the user #{ENV['USER']} to be in the staff group. If this
sucks for you then you can install Homebrew in your home directory or however
you please; please refer to the website. If you still want to use this script
the following command should work:

dscl /Local/Default -append /Groups/staff GroupMembership $USER
EOABORT

ohai "This script will install:"
puts "/srv/local/bin/brew"
puts "/srv/local/Library/Formula/..."
puts "/srv/local/Library/Homebrew/..."

chmods = %w( share/man lib/pkgconfig var/log share/locale
            share/man/man1 share/man/man2 share/man/man3 share/man/man4
            share/man/man5 share/man/man6 share/man/man7 share/man/man8
            share/info share/doc share/aclocal ).map{ |d| "/srv/local/#{d}" }
root_dirs = []
%w(bin Cellar etc include lib Library sbin share var .git).each do |d|
    d = "/srv/local/#{d}"
    if File.directory? d then chmods else root_dirs end << d
end
chmods = chmods.select{ |d| File.directory? d and not File.writable? d }
chgrps = chmods.reject{ |d| File.stat(d).grpowned? }

unless chmods.empty?
    ohai "The following directories will be made group writable:"
    puts *chmods
end
unless chgrps.empty?
    ohai "The following directories will have their group set to #{Tty.underline 39}staff#{Tty.reset}:"
    puts *chgrps
end

sudo "/bin/mkdir /srv/local" unless File.directory? "/srv/local"
sudo "/bin/chmod o+w /srv/local"
begin
    sudo "/bin/chmod", "g+w", *chmods unless chmods.empty?
    sudo "/usr/bin/chgrp", "staff", *chgrps unless chgrps.empty?
    system "/bin/mkdir", *root_dirs unless root_dirs.empty?
    
    Dir.chdir "/srv/local" do
        ohai "Downloading and Installing Homebrew..."
        # -m to stop tar erroring out if it can't modify the mtime for root owned directories
        # pipefail to cause the exit status from curl to propogate if it fails
        system "/bin/bash -o pipefail -c '/usr/bin/curl -sSfL https://github.com/mxcl/homebrew/tarball/master | /usr/bin/tar xz -m --strip 1'"
    end
    ensure
    # we reset the permissions of /srv/local because we want to minimise the
    # amount of fiddling we do to the system. Some tools require /srv/local to
    # be by non-writable for non-root users.
    sudo "/bin/chmod o-w /srv/local"
end

warn "/srv/local/bin is not in your PATH." unless ENV['PATH'].split(':').include? '/srv/local/bin'
warn "Now install Xcode: http://developer.apple.com/technologies/xcode.html" unless Kernel.system "/usr/bin/which -s gcc"

unless badlibs.empty?
    warn "The following *evil* dylibs exist in /srv/local/lib"
    puts "They may break builds or worse. You should consider deleting them:"
    puts *badlibs
end

ohai "Installation successful!"
puts "Now type: brew help"