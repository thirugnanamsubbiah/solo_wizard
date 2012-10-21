require File.expand_path("config/environment.rb")

class SoloWizardTasks < Thor

  desc "clean_all_tables", "Empty out all of the tables"
  def clean_all_tables
    SoloistScript.destroy_all
    Recipe.destroy_all
    RecipeGroup.destroy_all
  end

  desc "create_pivotal_workstation_recipes", "Create the initial set of recipes from pivotal workstation"
  def create_pivotal_workstation_recipes
    group01 = RecipeGroup.create :name => "Development Stack", :position => 1
    group02 = RecipeGroup.create :name => "Databases", :position => 2
    group03 = RecipeGroup.create :name => "General Software", :position => 6
    group04 = RecipeGroup.create :name => "OS-X Settings", :position => 7, :description => "Configuring your OS-X with some helpful settings"
    group05 = RecipeGroup.create :name => ".bash_profile", :position => 8
    group06 = RecipeGroup.create :name => "Command Line Tools", :position => 3
    group07 = RecipeGroup.create :name => "Source Control", :position => 4
    group08 = RecipeGroup.create :name => "Text Editors", :position => 5
    group09 = RecipeGroup.create :name => "Etc", :position => 9
    group10 = RecipeGroup.create :name => "Pivotal Workstation Meta", :position => 10, :description => "Each 'Meta' recipe is a collection of other recipes"

    group06.recipes.create :name => "ack", :checked_by_default => true, :description => "Ack is a powerful alternative to grep(regular expression search) for programmers. It is faster than grep."
    group04.recipes.create :name => "active_corners", :checked_by_default => false, :description => "This recipe relaunches dock with corner values with either one of desktop,dashboard,mission control,application windows,launchpad,start screen saver, disable screen saver, put display to sleep."
    group01.recipes.create :name => "activemq", :checked_by_default => false, :description => "Apache ActiveMQ is the most popular and powerful open source messaging and Integration Patterns server. It supports many Cross Language Clients and Protocols and many advanced features while fully supporting JMS 1.1 and J2EE 1.4."
    group09.recipes.create :name => "add_ops_user", :checked_by_default => false, :description => "This recipe adds a new 'ops' user and adds it to kernal and creates a home directory for the same user and adds it a admin user."
    group06.recipes.create :name => "ag", :checked_by_default => false, :description => "Ag is similar to Ack,searches through code, but faster than Ack, which in turn is faster than grep."
    group03.recipes.create :name => "alfred", :checked_by_default => false, :description => ""
    group05.recipes.create :name => "bash_path_order", :checked_by_default => true, :description => "It appends '/usr/local/bin:' before ENV['PATH']. It also opens every file in '/etc/paths/' location and updates the first line with '/usr/local/bin\\n' and removes any occurrences of '/usr/local/bin\\n' thereafter."
    group05.recipes.create :name => "bash_profile-aliases", :checked_by_default => true, :description => "Adds some helpful bash aliases: 'll' for the 'ls -lhA' command.  And adds color=auto to grep command"
    group05.recipes.create :name => "bash_profile-arch_flags", :checked_by_default => false, :description => "This recipe creates an environment variable ARCHFLAGS and sets value '-arch x86_64' for it."
    group05.recipes.create :name => "bash_profile-better_history", :checked_by_default => true, :description => "This recipe sets history control for bash and sets to ignore duplicates, sets size for history as 10000 and also enables to append data to the history file rather than overwriting."
    group05.recipes.create :name => "bash_profile-ctrl-o", :checked_by_default => true, :description => "Go back to a command in history and press CTRL-O instead of RETURN. This will execute the command and bring up the next command in the history file. Press CTRL-O again to enter this command and bring up the next one. This recipe enables CTRL-O."
    group05.recipes.create :name => "bash_profile-ctrl-s", :checked_by_default => false, :description => "This recipe disables start/stop  output control and frees up CTRL-S for bash history forward searches."
    group05.recipes.create :name => "bash_profile-git_completion", :checked_by_default => true, :description => "This recipe installs git-core and bash-completion.  bash-completion extends bash's standard completion behavior to achieve complex lines with just a few keystrokes. This recipe adds completion for git commands."
    group05.recipes.create :name => "bash_profile-lang_en", :checked_by_default => false, :description => "This recipe sets the language and locale to US English and encoding to UTF-8."
    group05.recipes.create :name => "bash_profile-no_sudo_gem_install", :checked_by_default => true, :description => "This recipe raises error whenever 'sudo gem' command is used to install the gem."
    group05.recipes.create :name => "bash_profile-ps1", :checked_by_default => true, :description => "The appearance of the prompt in a shell is governed by the shell variable PS1. This recipe can change the default value for PS1."
    group05.recipes.create :name => "bash_profile-ree_settings", :checked_by_default => false, :description => "Tuning settings for REE (Ruby Enterprise Edition) concerning memory and heap slots"
    group09.recipes.create :name => "ca_certs_to_match_heroku", :checked_by_default => false, :description => "Iterates through every file in '/usr/lib/ssl', ''/usr/lib/ssl/certs/' and sets the current user as owner. This recipe also copies the '/usr/lib/ssl/certs/ca-certificates.crt' file from cookbook as 'cacert.pem' in read-only mode."
    group03.recipes.create :name => "ccmenu", :checked_by_default => true, :description => "CCMenu displays the project status of CruiseControl continuous integration servers as an item in the Mac OS X menu bar."
    group03.recipes.create :name => "chrome", :checked_by_default => true, :description => "Google Chrome is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
    group09.recipes.create :name => "create_var_chef_cache", :checked_by_default => true, :description => "This recipe creates a file cache path directory and makes 'root' as its owner."
    group09.recipes.create :name => "default_editor", :checked_by_default => true, :description => "This recipe sets TextMate to be the default editor for .xml, .rb, .erb, .plain-text, .yml, .yaml"
    group04.recipes.create :name => "defaults_fast_key_repeat_rate", :checked_by_default => true, :description => "This recipe sets KeyRepeat to 2 and InitialKeyRepeat to 15 in global preferences for the user"
    group04.recipes.create :name => "disable_front_row", :checked_by_default => false, :description => "Front Row was a media center software application for Apple's Macintosh computers and Apple TV for navigating and viewing video, photos, podcasts, and music from a computer, optical disc, or the Internet through a 10-foot user interface (similar to Windows Media Center and Boxee). This recipe disables Front Row software."
    group04.recipes.create :name => "dock_preferences", :checked_by_default => false, :description => "This recipe sets the dock preferences as left orientated and auto hide option to true as default."
    group03.recipes.create :name => "dropbox", :checked_by_default => true, :description => "Dropbox is a free service that lets you bring your photos, docs, and videos anywhere and share them easily."
    group06.recipes.create :name => "ec2_api_tools", :checked_by_default => false, :description => "The EC2 API tools serve as the client interface to the Amazon EC2 web service. This recipe installs EC2 API tools on Mac OS X and includes the 'ec2_tools' action from the bash profile."
    group04.recipes.create :name => "enable_assistive_devices", :checked_by_default => true, :description => "This recipe turns on 'Assistive devices' from the system preferences."
    group01.recipes.create :name => "erlang", :checked_by_default => false, :description => ""
    group03.recipes.create :name => "evernote", :checked_by_default => false, :description => ""
    group04.recipes.create :name => "finder_display_full_path", :checked_by_default => false, :description => "The Finder in OS X Lion provides access to files and folders. This recipe sets finder to show full path in title bar."
    group03.recipes.create :name => "firefox", :checked_by_default => true, :description => "Mozilla Firefox is a free and open source web browser developed for Microsoft Windows, Mac OS X, and Linux coordinated by Mozilla Corporation and Mozilla Foundation."
    group03.recipes.create :name => "flycut", :checked_by_default => true, :description => "Flycut is a clipboard manager for Mac systems."
    group03.recipes.create :name => "freeruler", :checked_by_default => false, :description => "Free Ruler is a free screen ruler for Mac OS X."
    group04.recipes.create :name => "function_keys", :checked_by_default => true, :description => "This recipe maps the function key action to default function key actions to the OS."
    group09.recipes.create :name => "gem_no_rdoc_no_ri", :checked_by_default => true, :description => "This recipe sets the preference for installing a gem package without rdoc and ri."
    group07.recipes.create :name => "git", :checked_by_default => true, :description => "Git is a distributed revision control and source code management system with an emphasis on speed."
    group07.recipes.create :name => "git_config_global_defaults", :checked_by_default => true, :description => "This recipe sets a global git ignore, aliases (st for status, di for diff, co for checkout, ci for commit, br for branch, sta for stash, llog for log --date=local), no warning for whitespace, colors, and also branch auto setup merge as true."
    group07.recipes.create :name => "git_projects", :checked_by_default => false, :description => "This recipe clones all the git projects to workspace of the current user."
    group07.recipes.create :name => "git_scripts", :checked_by_default => true, :description => "This recipe downloads git_scripts to '/usr/local/bin' of current user."
    group07.recipes.create :name => "github_for_mac", :checked_by_default => true, :description => "Github for Mac is a software to make code sharing easy with github."
    group07.recipes.create :name => "github_ssh_keys", :checked_by_default => false, :description => "This recipe creates SSH keys and adds 'github.com' to the list of known hosts if not added already. It also tries to add the created SSH keys to the github.com of possible."
    group07.recipes.create :name => "gitx", :checked_by_default => true, :description => "GitX is a git GUI made for Mac OS X. It currently features a history viewer much like gitk and a commit GUI like git gui."
    group09.recipes.create :name => "global_environment_variables", :checked_by_default => true, :description => "This recipe sets global environment path to include /usr/local/bin, /usr/bin, /bin, /usr/sbin, /sbin, and /usr/X11/bin"
    group09.recipes.create :name => "google_chrome_prevent_updates", :checked_by_default => false, :description => "This recipe prevent Chrome from updating by preventing writability of update directory."
    group03.recipes.create :name => "grid", :checked_by_default => false, :description => "Grid is a software which allows networked computers to contribute to a single task."
    group06.recipes.create :name => "homebrew", :checked_by_default => true, :description => "Homebrew is a package management system that simplifies the installation of software on the Mac OS X operating system."
    group01.recipes.create :name => "imagemagick", :checked_by_default => true, :description => "ImageMagick is an open source software suite for displaying, converting, and editing image files. It can read and write over 100 image file formats."
    group09.recipes.create :name => "increase_shared_memory", :checked_by_default => true, :description => "SHMMAX and SHMALL are two key shared memory parameters that directly impact’s the way by which an SGA(Systm Global Area) is created. This recipe sets shmall to 65536 bytes and shmmax to 16777216 bytes"
    group04.recipes.create :name => "input_on_login", :checked_by_default => false, :description => "This recipe sets preferences to show input menu on the login screen."
    group09.recipes.create :name => "inputrc", :checked_by_default => true, :description => "This recipe enables to edit the default keybindings by editing inputrc file."
    group08.recipes.create :name => "intellij_community_edition", :checked_by_default => false, :description => "IntelliJ IDEA is a commercial Java IDE by JetBrains."
    group08.recipes.create :name => "intellij_ultimate_edition", :checked_by_default => false, :description => "IntelliJ IDEA is a commercial Java IDE by JetBrains."
    group06.recipes.create :name => "iterm2", :checked_by_default => true, :description => "iTerm2 is a replacement for Terminal and the successor to iTerm."
    group01.recipes.create :name => "java", :checked_by_default => true, :description => "Java is a programming language which derives much of its syntax from C and C++ but has a simpler object model and fewer low-level facilities than either C or C++."
    group08.recipes.create :name => "joe", :checked_by_default => false, :description => "Joe is an easy to use command line editor for Mac OS X."
    group06.recipes.create :name => "jumpcut", :checked_by_default => false, :description => "Jumpcut is an application that provides 'clipboard buffering' that is, access to text that you've cut or copied, even if you've subsequently cut or copied something else. The goal of Jumpcut's interface is to provide quick, natural, intuitive access to your clipboard's history."
    group04.recipes.create :name => "keyboard_preferences", :checked_by_default => true, :description => "This recipe enables full keyboard access for all controls, so you can navigate through the UI using keyboard"
    group03.recipes.create :name => "keycastr", :checked_by_default => true, :description => "KeyCastr, an open-source keystroke visualizer for Mac OS X."
    group03.recipes.create :name => "libreoffice", :checked_by_default => false, :description => "LibreOffice is the power-packed free, libre and open source personal productivity suite for Windows, Macintosh and GNU/Linux, that gives six feature-rich applications for all document production and data processing needs: Writer, Calc, Impress, Draw, Math and Base."
    group09.recipes.create :name => "lion_basedev", :checked_by_default => false, :description => "This recipe includes all base recipes for Mac OS X 10.8 referred to as 'Mountain Lion'."
    group09.recipes.create :name => "locate_on", :checked_by_default => true, :description => "This recipe checks and loads locate, which indexes the filesystem"
    group01.recipes.create :name => "memcached", :checked_by_default => false, :description => "Memcached is an in-memory key-value store for small chunks of arbitrary data (strings, objects) from results of database calls, API calls, or page rendering."
    group04.recipes.create :name => "menubar_preferences", :checked_by_default => true, :description => "This recipe disables the default Apple Menubar transparency (ref:  http://knoopx.net/2011/10/28/os-x-lion-tweaks )"
    group03.recipes.create :name => "menumeters", :checked_by_default => true, :description => "MenuMeters is a set of CPU, memory, disk, and network monitoring tools for Mac OS X. This recipe installs MenuMeter and adds that to the preferences panes next to the clock."
    group10.recipes.create :name => "meta_osx_base", :checked_by_default => false, :description => ""
    group10.recipes.create :name => "meta_osx_development", :checked_by_default => false, :description => ""
    group10.recipes.create :name => "meta_pivotal_lion_image", :checked_by_default => false, :description => ""
    group10.recipes.create :name => "meta_pivotal_specifics", :checked_by_default => false, :description => ""
    group10.recipes.create :name => "meta_ruby_development", :checked_by_default => false, :description => ""
    group02.recipes.create :name => "mongodb", :checked_by_default => false, :description => "MongoDB is part of the NoSQL family of database systems. Instead of storing data in tables as is done in a 'classical' relational database, MongoDB stores structured data as JSON-like documents with dynamic schemas (MongoDB calls the format BSON), making the integration of data in certain types of applications easier and faster.This recipe installs mongodb, add it to the preference pane and adds it to the startup"
    group03.recipes.create :name => "mouse_locator", :checked_by_default => true, :description => "Mouse Locator is a simple preference add-on that can be either triggered by a keystroke or always enabled, it creates a green crosshair of sorts around the cursor making it easy to identify on screen. This recipe installs & activates MouseLocator and adds it to preference pane"
    group02.recipes.create :name => "mysql", :checked_by_default => true, :description => "MySQL is an open source database management system and is used in some of the most frequently visited websites on the Internet.This recipe installs mysql db and sets up the timezone info in db if not set."
    group01.recipes.create :name => "nginx", :checked_by_default => false, :description => "Nginx is an open source Web server and a reverse proxy server for HTTP, SMTP, POP3 and IMAP protocols, with a strong focus on high concurrency, performance and low memory usage.Many ruby web frameworks runs on this.This recipe brew installs nginx and copies the nginx.config template to the nginx configuration path "
    group01.recipes.create :name => "node_js", :checked_by_default => true, :description => "Node.js is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices.This recipe installs node.js through npm, which is downloaded from git and compiled"
    group06.recipes.create :name => "oh_my_zsh", :checked_by_default => false, :description => ""
    group09.recipes.create :name => "osx_updates", :checked_by_default => false, :description => "This recipe checks and installs all available osx update from apple"
    group03.recipes.create :name => "pg_admin", :checked_by_default => false, :description => "pgAdmin is the leading graphical Open Source management, development and administration tool for PostgreSQL."
    group09.recipes.create :name => "pivotal_logos", :checked_by_default => false, :description => "This recipe changes the pivotal backgrounds, logos and colors to make the application logos less intrusive to the user"
    group02.recipes.create :name => "postgres", :checked_by_default => true, :description => " PostgreSQL, often simply Postgres, is an object-relational database management system (ORDBMS) available for many platforms including Linux, FreeBSD, Solaris, Microsoft Windows and Mac OS X.  This recipe installs postgres and add it to startup. creates the default db with user 'postgres'"
    group03.recipes.create :name => "propane", :checked_by_default => false, :description => ""
    group01.recipes.create :name => "qt", :checked_by_default => true, :description => "Qt is a cross-platform application framework that is widely used for developing application software with a graphical user interface (GUI) (in which cases Qt is classified as a widget toolkit), and also used for developing non-GUI programs such as command-line tools and consoles for servers."
    group01.recipes.create :name => "rabbitmq", :checked_by_default => false, :description => "RabbitMQ is open source message broker software (message-oriented middleware) that implements the Advanced Message Queuing Protocol standard. It is written in Erlang."
    group06.recipes.create :name => "rbenv", :checked_by_default => false, :description => "rbenv lets you easily switch between multiple versions of Ruby. It's simple, unobtrusive, and follows the UNIX tradition of single-purpose tools that do one thing well. This recipe packages rbenv and configures all the existing versions with options and sets the default version of ruby to be used.  "
    group01.recipes.create :name => "redis", :checked_by_default => false, :description => "Redis is an open-source, networked, in-memory, key-value data store with optional durability. This recipe installs redis and adds it to the startup."
    group04.recipes.create :name => "remove_expose_keyboard_shortcuts", :checked_by_default => false, :description => "This recipe removes the expose keyboard shortcuts in the system preference."
    group04.recipes.create :name => "remove_garageband", :checked_by_default => false, :description => "GarageBand is a multitrack recording application using which you can record real audio pieces, play with software instruments, create parts using Apple Loops, add effects, mix your music and play it all back with iTunes or include in your iMovies.. This recipe removes the garageband app."
    group09.recipes.create :name => "rename_machine", :checked_by_default => false, :description => "This recipe rename the machine with set of hostnames given in the preference."
    group08.recipes.create :name => "rubymine", :checked_by_default => true, :description => "RubyMine is an IDE which provides intelligent code completion for Ruby and Ruby on Rails code, on-the-fly code analysis and refactoring support for both plain Ruby projects and web applications built with Ruby on Rails."
    group08.recipes.create :name => "rubymine_preferences_pivotal", :checked_by_default => true, :description => "This recipe configures the rubymine with the keymaps and templates included."
    group06.recipes.create :name => "rvm", :checked_by_default => true, :description => "Ruby Version Manager known as RVM is a Unix software platform that can be used to manage multiple installations of Ruby on the same device.This recipe installs rvm and the ruby version specified. It also sets the default ruby version to be used "
    group04.recipes.create :name => "safari_preferences", :checked_by_default => false, :description => "This recipe sets a preference in safari browser to show the status bar."
    group03.recipes.create :name => "screen_sharing_app", :checked_by_default => true, :description => "ScreenSharing app lets you to share your Desktop screen with the remote machines."
    group04.recipes.create :name => "screen_sharing_on", :checked_by_default => false, :description => "This recipe configures the vnc port for screen sharing and checks for screen sharing enabled."
    group01.recipes.create :name => "selenium_webdriver", :checked_by_default => false, :description => "Selenium is a portable software testing framework for web applications. Selenium provides a record/playback tool for authoring tests without learning a test scripting language (Selenium IDE).  This recipe installs seleium webdriver and configure it with chromium web browser."
    group04.recipes.create :name => "set_finder_show_all_hd_on_desktop", :checked_by_default => false, :description => "This recipe sets the preference to show the internal and external harddrives, removable media on desktop"
    group04.recipes.create :name => "set_finder_show_hd_on_desktop", :checked_by_default => false, :description => "This recipe sets the preference to show the internal  hard drives on desktop"
    group04.recipes.create :name => "set_finder_show_user_home_in_sidebar", :checked_by_default => false, :description => "This recipe sets the preference to show user home in the sidebar"
    group04.recipes.create :name => "set_multitouch_preferences", :checked_by_default => false, :description => "This recipe sets the preference for multitouch, allowing  clicking and dragging by touch"
    group04.recipes.create :name => "set_screensaver_preferences", :checked_by_default => false, :description => "This recipe sets preferences for screensaver like displaying screensaver, locking screen, asking password if the screen is locked and timeout for display, disk and computer sleep times."
    group03.recipes.create :name => "shiftit", :checked_by_default => false, :description => "ShiftIt is an application for OSX that allows you to quickly manipulate window position and size using keyboard shortcuts. This recipe installs ShiftIt on the system and adds it to Auto Launch Application directory."
    group03.recipes.create :name => "sizeup", :checked_by_default => true, :description => "Size up is a window management software for Mac OS X. This recipe installs Size up and enables assistive services by default."
    group03.recipes.create :name => "skype", :checked_by_default => true, :description => "Skype is a proprietary voice-over-Internet Protocol service and software application. The service allows users to communicate with peers by voice, video, and instant messaging over the Internet and Phone calls may be placed to recipients on the traditional telephone networks."
    group01.recipes.create :name => "snmpd", :checked_by_default => false, :description => "snmpd is an SNMP(Simple Network Management Protocol) agent which binds to a port and awaits requests from SNMP management software. This recipe launches snmpd daemon."
    group01.recipes.create :name => "solr", :checked_by_default => false, :description => "Solr is an open source enterprise search platform from the Apache.  Its major features include powerful full-text search, hit highlighting, faceted search, dynamic clustering, database integration, and rich document handling. Providing distributed search and index replication, Solr is highly scalable."
    group09.recipes.create :name => "ssh_copy_id", :checked_by_default => false, :description => "ssh-copy-id is a script that uses ssh to log into a remote machine presumably using a login password, so password authentication should be enabled.  This recipe installs ssh-copy-id"
    group06.recipes.create :name => "sshd_on", :checked_by_default => true, :description => "sshd is the daemon program for ssh.Together these programs replace rlogin and rsh, and provide secure encrypted communications between two untrusted hosts over an insecure network. This recipe turns on sshd daemon."
    group09.recipes.create :name => "ssl_certificate", :checked_by_default => false, :description => "This recipe creates ssl certificates and adds it to the list of trusted certificates."
    group08.recipes.create :name => "sublime_text", :checked_by_default => false, :description => ""
    group07.recipes.create :name => "svn", :checked_by_default => false, :description => "Apache Subversion (SVN) is a software versioning and revision control system distributed under an open source license."
    group04.recipes.create :name => "terminal_focus", :checked_by_default => false, :description => "FocusFollowsMouse is where the focus automatically follows the current placement of the pointer. This recipe enables FocusFollowsMouse for terminal."
    group04.recipes.create :name => "terminal_preferences", :checked_by_default => false, :description => "This recipe sets preferences for terminal color scheme and startup terminal color scheme."
    group08.recipes.create :name => "textmate", :checked_by_default => true, :description => "TextMate is a general-purpose GUI text editor for Mac OS X created by Allan Odgaard. Notable features include declarative customizations, tabs for open documents, recordable macros, folding sections and snippets, shell integration, and an extensible bundle system."
    group08.recipes.create :name => "textmate_bundles", :checked_by_default => true, :description => "This recipe downloads textmate bundles from http://cheffiles.pivotallabs.com/Pivotal.tmbundle.tar.gz and installs from the source"
    group08.recipes.create :name => "textmate_plugins", :checked_by_default => false, :description => "ProjectPlus is a plug-in for TextMate which extends the functionality of project-related features. This recipe adds ProjectPlus plug-in to textmate."
    group08.recipes.create :name => "textmate_preferences", :checked_by_default => true, :description => "This recipe set textmate preference like show linenumbers, tabspace, save on losing focus, soft tabs"
    group04.recipes.create :name => "timemachine_preferences", :checked_by_default => false, :description => "This recipe removes the timemachine from system tray and stops it from asking new disk space for backup"
    group06.recipes.create :name => "tmux", :checked_by_default => true, :description => "tmux is a software application that can be used to multiplex several virtual consoles, allowing a user to access multiple separate terminal sessions inside a single terminal window or remote terminal session. This recipe installs tmux and adds the tmux config file."
    group06.recipes.create :name => "unix_essentials", :checked_by_default => true, :description => "This recipe installs the basic unix essentials like wget, pstree, tree, watch, ssh-copy-id"
    group09.recipes.create :name => "user_owns_usr_local", :checked_by_default => true, :description => "This recipe changes the owner of the '/usr/local' to WS_User"
    group03.recipes.create :name => "vagrant", :checked_by_default => false, :description => "Vagrant enables a user to create and configure lightweight, reproducible, and portable virtualized development environments. This recipe installs Vagrant on the system."
    group08.recipes.create :name => "vim", :checked_by_default => true, :description => "Based on the vi editor common to Unix-like systems, Vim is designed for use both from a command line interface and as a standalone application in a graphical user interface. This recipe installs vim and macvim."
    group03.recipes.create :name => "virtualbox", :checked_by_default => true, :description => "VirtualBox is installed on an existing host operating system as an application; this host application allows additional guest operating systems, each known as a Guest OS, to be loaded and run, each with its own virtual environment."
    group04.recipes.create :name => "window_focus", :checked_by_default => false, :description => "FocusFollowsMouse is where the focus automatically follows the current placement of the pointer. This recipe enables FocusFollowsMouse for X11 windows."
    group09.recipes.create :name => "workspace_directory", :checked_by_default => true, :description => "This recipe creates workspace directory inside current user's home directory."
    group03.recipes.create :name => "xquartz", :checked_by_default => true, :description => "The XQuartz project is an open-source effort to develop a version of the X.Org X Window System that runs on OS X."
    group06.recipes.create :name => "zsh", :checked_by_default => false, :description => "The Z shell (zsh) is a Unix shell that can be used as an interactive login shell and as a powerful command interpreter for shell scripting."
  end

end