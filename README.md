# Environment Setup

A cross-platform dotfiles and package management system that works seamlessly across Linux (Arch) and macOS machines using hostname-based configurations following Star Trek ship naming conventions.

## Overview

This repository provides:
- **Dotfiles management** using GNU Stow for symlink-based configuration
- **Package management** with platform-aware installation (pacman/AUR on Linux, Homebrew on macOS)
- **Host-specific configurations** organized by Star Trek ship names
- **Cross-platform compatibility** with automatic platform detection

## Quick Start

### Install Everything
```bash
cd ~/dev/environment
./install
```

### Install Components Separately
```bash
# Dotfiles only
./install dotfiles

# Packages only  
./install packages
```

## Host Configuration

Your machines are organized by Star Trek ship names:
- **enterprise**: Linux host
- **intrepid**: Linux host  
- **voyager**: macOS host (this machine)

The system automatically detects your platform and maps hostnames to ship names.

## Package Management

### Check Status
```bash
cd packages
./manage status
```

### Analyze Unmanaged Packages
```bash
./manage analyze
```

### Clean Up System
```bash
./manage clean
```

### Backup Configuration
```bash
./manage backup
```

## Platform-Specific Features

### macOS (Homebrew)
- Automatic Homebrew installation if not present
- Smart detection of formulas vs casks
- Mixed package installation support
- Homebrew-specific cleanup commands

### Linux (Arch)
- pacman for official repositories
- AUR helper support (paru/yay)
- Orphaned package cleanup
- Package conflict resolution

## Directory Structure

```
environment/
├── dotfiles/           # Dotfiles managed with GNU Stow
│   ├── home/          # Files to be symlinked to ~/
│   └── install        # Dotfiles installation script
├── packages/          # Package management
│   ├── group/         # Host-specific package lists
│   │   ├── voyager/   # macOS packages
│   │   ├── enterprise/# Linux packages
│   │   └── intrepid/  # Linux packages
│   ├── install        # Package installation script
│   ├── manage         # Package management utility
│   ├── analyze        # Package analysis tool
│   └── clean          # System cleanup tool
└── install            # Main installation script
```

## Dotfiles

The dotfiles system uses GNU Stow to create symlinks from your home directory to files in `dotfiles/home/`. This keeps your actual dotfiles under version control while presenting them in their expected locations.

### Conflict Resolution

When installing dotfiles, the system will detect conflicts with existing files and offer options:
1. **Adopt**: Move existing files into the dotfiles repo and create symlinks
2. **Backup**: Save existing files and install fresh symlinks  
3. **Skip**: Cancel installation

## Package Groups

Each host has package groups in `packages/group/{hostname}/`:

### Base Packages
Common development tools and utilities needed across all environments of that platform.

### Host Packages  
Machine-specific applications and tools unique to that particular host.

## Advanced Usage

### Adding New Packages

1. **For macOS (voyager)**:
   ```bash
   echo "package-name" >> packages/group/voyager/base    # For base packages
   echo "package-name" >> packages/group/voyager/host    # For host-specific packages
   ```

2. **For Linux hosts**:
   ```bash
   echo "package-name" >> packages/group/enterprise/base  # For enterprise host
   echo "package-name" >> packages/group/intrepid/base    # For intrepid host
   ```

### Managing Package Lists

Use the interactive analyzer to organize existing packages:
```bash
cd packages
./manage analyze
```

This will:
- Find unmanaged packages on your system
- Allow you to categorize them into appropriate groups
- Remove packages you no longer need

### Creating Backups

Before making major changes:
```bash
cd packages  
./manage backup
```

Creates timestamped backups in `packages/backups/` with:
- Current package group files
- System package lists
- Restore instructions

### Validating Configuration

Check your package files for issues:
```bash
cd packages
./manage validate
```

## Platform Detection

The system automatically detects your platform and sets appropriate variables:

- **macOS**: Uses `scutil --get LocalHostName` and maps to ship names
- **Linux**: Uses `hostnamectl --static` for hostname detection
- **Hostname Mapping**: Your MacBook Air ("Scotts-MacBook-Air-2") maps to "voyager"

### Setting Your Hostname to Match Ship Names

For the cleanest setup, you can change your system hostname to match the Star Trek ship names directly:

#### macOS Hostname Change

To change your Mac's hostname to "voyager":

```bash
# Set the computer name (what shows in System Preferences)
sudo scutil --set ComputerName "voyager"

# Set the local hostname (used for Bonjour/local network)
sudo scutil --set LocalHostName "voyager"

# Set the hostname (used by the terminal and system)
sudo scutil --set HostName "voyager"

# Flush DNS cache to apply changes immediately
sudo dscacheutil -flushcache
```

#### Linux Hostname Change

To change your Linux hostname to ship names (enterprise, intrepid, etc.):

```bash
# Set the hostname (replace 'enterprise' with your desired ship name)
sudo hostnamectl set-hostname enterprise

# Update /etc/hosts file
sudo sed -i 's/127.0.1.1.*/127.0.1.1\tenterprise/' /etc/hosts
```

#### After Changing Hostname

1. **Reboot your system** for all changes to take effect
2. **Verify the change**: Run `hostname` to confirm
3. **Update package groups**: If you changed to a new ship name, create the appropriate directory:
   ```bash
   mkdir -p packages/group/your-new-hostname
   # Copy or create base and host files as needed
   ```

### Hostname Mapping

If you prefer to keep your current hostname, the system includes automatic mapping:

- **macOS**: "Scotts-MacBook-Air-2" → "voyager"
- **Linux**: Direct hostname usage

You can modify the mapping in the scripts if you need custom hostname translations.

## Troubleshooting

### Package Installation Fails
1. Check package name spelling in your group files
2. For macOS: Verify package exists in Homebrew with `brew search package-name`
3. For Linux: Check if package is in AUR vs official repos

### Dotfiles Conflicts
- Use the interactive conflict resolution during installation
- Or manually resolve conflicts before running install

### Missing AUR Helper (Linux)
Install paru or yay:
```bash
# For paru
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si

# For yay  
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
```

## Contributing

When adding new dotfiles or packages:

1. **Dotfiles**: Add to `dotfiles/home/` in the appropriate directory structure
2. **Packages**: Add to the appropriate host's base or host file
3. **Cross-platform**: Test on both macOS and Linux if possible

## Legacy Documentation

### Original packages/install Documentation

This is a bash script that automates the installation of packages listed in files located in a directory corresponding to the hostname of the system. Here's a breakdown of the command:

#### 1. `#!/bin/bash`

This line is called a shebang and specifies that the script should be executed with the `bash` shell.

#### 2. `export HOST=$(hostname)`

This line sets an environment variable `HOST` to the system's hostname (using the `hostname` command). The `$(...)` syntax is command substitution, meaning it captures the output of `hostname` and assigns it to the `HOST` variable.

#### 3. `for file in ./group/$HOST/*; do`

This line starts a `for` loop that iterates over all files in the `./group/$HOST/` directory. The `$HOST` variable will be replaced by the hostname of the system, so it looks for files inside the directory named after the current hostname (e.g., `./group/myhostname/`).

#### 4. `echo "installing $file"`

For each file, the script will print a message to the terminal stating which file is being processed.

#### 5. `sudo pacman -D --asexplicit - < "$file"`

This line installs packages listed in the current file using the `pacman` package manager (which is used on Arch Linux and derivatives).

* `-D` option marks the packages as explicitly installed.
* `--asexplicit` marks the package as explicitly installed, meaning it won't be automatically removed as an unused dependency later.
* `-` tells `pacman` to read the list of packages from standard input.
* `< "$file"` uses the current file as the input, so each package inside the file will be installed.

#### 6. `paru -S --asexplicit --needed - < "$file"`

After running `pacman`, the script uses `paru` (an AUR helper for Arch Linux) to install packages:

* `-S` tells `paru` to sync and install packages.
* `--asexplicit` again marks the packages as explicitly installed.
* `--needed` ensures that packages are installed only if they are not already installed.
* `-` reads the list of packages from standard input, just like the `pacman` command.
* `< "$file"` uses the current file as input.

#### 7. `done`

This marks the end of the `for` loop. The script will continue to the next file in the `./group/$HOST/` directory until all files have been processed.

#### Summary

This script is automating the installation of packages listed in files that are located in a folder named after the system's hostname. It uses `pacman` for native Arch Linux packages and `paru` for AUR packages, ensuring that each package is explicitly installed and only installed if needed.

### Symlinks Documentation

**Clarifying symlink request**

The user seems to want to symlink the `base` file inside `nc-1701-d` to `../base`. To do this correctly, I would remove the current file and create a symlink:

```bash
cd group
rm nc-1701-d/base
ln -s ../base nc-1701-d/base
```

They also mentioned the `host` file, and while it's a bit unclear, it seems like they want to symlink that too. Since they specifically referred to the `base` file, my guess is they want to symlink that first. Let me keep an eye on that!

From inside your `group/nc-1701-d/` directory just replace that tiny `base` file with a symlink back to the real one:

```bash
cd group/nc-1701-d/
rm base
ln -s ../base base
```

Now if you do:

```bash
ls -l group/nc-1701-d/
```

you'll see:

```bash
base -> ../base
host
```

and when your script loops over `./group/$HOST/*` it will pick up the symlinked `base`, which transparently points to the single `group/base` file. Any edits you make in `group/base` will automatically be seen under `group/nc-1701-d/base`.

### dotfiles/install Documentation

**Explaining the command**

`stow -R -v -t ~ -d ~/dev/environment/home .`

* **stow**: This is a manager for symlinking files, typically used to manage dotfiles.
* **-R**: The `--restow` option removes and recreates symlinks.
* **-v**: Verbose mode, which makes Stow give detailed logs.
* **-t ~**: This sets the target directory to the user's home directory (`~`).
* **-d ~/dev/environment/home**: The "stow" packages are in this directory.
* **.**: The current directory is treated as a stow package to act on.

This is using GNU Stow to manage a "dotfiles" (or other config) tree under `~/dev/environment/home` and symlink it into your real home directory.

Here's the breakdown:

* `stow`
  The command-line tool that creates (or removes) symlinks for you, based on a "package" layout.

* `-d ~/dev/environment/home`
  **Stow directory**: where your packages live. Inside this directory you have one or more packages (normally each a subdirectory), each containing the files you want to link.

* `.`
  The name of the package to (re-)stow. Here you're pointing Stow at the "current directory" within that stow directory—i.e. everything under `~/dev/environment/home/`.

* `-t ~`
  **Target directory**: where the symlinks will be placed. In this case, your real home directory, `~`.

* `-R`
  **Restow**: first remove any existing symlinks that were created for this package, then recreate them. This is handy if you've updated or moved files in the source tree.

* `-v`
  **Verbose**: print out each remove/link operation as it happens.

---

**What happens when you run it**

1. Stow looks in `~/dev/environment/home` for the package "." (i.e. itself).
2. It removes any existing symlinks in `~/` that were previously created for that package.
3. It walks the directory tree under `~/dev/environment/home`, and for each file or folder, it creates a corresponding symbolic link in your home directory.

   * e.g. if you have `~/dev/environment/home/.bashrc`, Stow will symlink

     ```
     ~/.bashrc → ~/dev/environment/home/.bashrc
     ```
4. Because of `-v`, you'll see each remove/create step printed to your terminal.

In short: **you're "re-stowing" (refreshing) your entire config tree from `~/dev/environment/home` into your real `~` via symlinks**, keeping your home directory clean while managing everything under version control in `dev/environment/home`.