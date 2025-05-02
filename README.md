# environment

## packages/install

This is a bash script that automates the installation of packages listed in files located in a directory corresponding to the hostname of the system. Here’s a breakdown of the command:

### 1. `#!/bin/bash`

This line is called a shebang and specifies that the script should be executed with the `bash` shell.

### 2. `export HOST=$(hostname)`

This line sets an environment variable `HOST` to the system's hostname (using the `hostname` command). The `$(...)` syntax is command substitution, meaning it captures the output of `hostname` and assigns it to the `HOST` variable.

### 3. `for file in ./group/$HOST/*; do`

This line starts a `for` loop that iterates over all files in the `./group/$HOST/` directory. The `$HOST` variable will be replaced by the hostname of the system, so it looks for files inside the directory named after the current hostname (e.g., `./group/myhostname/`).

### 4. `echo "installing $file"`

For each file, the script will print a message to the terminal stating which file is being processed.

### 5. `sudo pacman -D --asexplicit - < "$file"`

This line installs packages listed in the current file using the `pacman` package manager (which is used on Arch Linux and derivatives).

* `-D` option marks the packages as explicitly installed.
* `--asexplicit` marks the package as explicitly installed, meaning it won’t be automatically removed as an unused dependency later.
* `-` tells `pacman` to read the list of packages from standard input.
* `< "$file"` uses the current file as the input, so each package inside the file will be installed.

### 6. `paru -S --asexplicit --needed - < "$file"`

After running `pacman`, the script uses `paru` (an AUR helper for Arch Linux) to install packages:

* `-S` tells `paru` to sync and install packages.
* `--asexplicit` again marks the packages as explicitly installed.
* `--needed` ensures that packages are installed only if they are not already installed.
* `-` reads the list of packages from standard input, just like the `pacman` command.
* `< "$file"` uses the current file as input.

### 7. `done`

This marks the end of the `for` loop. The script will continue to the next file in the `./group/$HOST/` directory until all files have been processed.

### Summary

This script is automating the installation of packages listed in files that are located in a folder named after the system's hostname. It uses `pacman` for native Arch Linux packages and `paru` for AUR packages, ensuring that each package is explicitly installed and only installed if needed.

## symlinks stuff

**Clarifying symlink request**

The user seems to want to symlink the `base` file inside `nc-1701-d` to `../base`. To do this correctly, I would remove the current file and create a symlink:

```bash
cd group
rm nc-1701-d/base
ln -s ../base nc-1701-d/base
```

They also mentioned the `host` file, and while it's a bit unclear, it seems like they want to symlink that too. Since they specifically referred to the `base` file, my guess is they want to symlink that first. Let me keep an eye on that!


Thought for a few seconds


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

you’ll see:

```bash
base -> ../base
host
```

and when your script loops over `./group/$HOST/*` it will pick up the symlinked `base`, which transparently points to the single `group/base` file. Any edits you make in `group/base` will automatically be seen under `group/nc-1701-d/base`.

```
[scotty@ncc-1701-d nc-1701-d]$ ln -s ../base base
[scotty@ncc-1701-d nc-1701-d]$ ls -l group/nc-1701-d
ls: cannot access 'group/nc-1701-d': No such file or directory
[scotty@ncc-1701-d nc-1701-d]$ ..
bash: ..: command not found
[scotty@ncc-1701-d nc-1701-d]$ cd ..
[scotty@ncc-1701-d group]$ cd ..
[scotty@ncc-1701-d packages]$ ls -l group/nc-1701-d
total 4
lrwxrwxrwx 1 scotty scotty  7 May  1 20:20 base -> ../base
-rw-r--r-- 1 scotty scotty 61 May  1 19:59 host
```

## dotfiles/install

**Explaining the command**

`stow -R -v -t  -d /dev/environment/home .`

* **stow**: This is a manager for symlinking files, typically used to manage dotfiles.
* **-R**: The `--restow` option removes and recreates symlinks.
* **-v**: Verbose mode, which makes Stow give detailed logs.
* \*\*-t \*\*: This sets the target directory to the user's home directory (\`\`).
* **-d /dev/environment/home**: The "stow" packages are in this directory.
* **.**: The current directory is treated as a stow package to act on.

This is using GNU Stow to manage a “dotfiles” (or other config) tree under `~/dev/environment/home` and symlink it into your real home directory.

Here’s the breakdown:

* `stow`
  The command-line tool that creates (or removes) symlinks for you, based on a “package” layout.

* `-d ~/dev/environment/home`
  **Stow directory**: where your packages live. Inside this directory you have one or more packages (normally each a subdirectory), each containing the files you want to link.

* `.`
  The name of the package to (re-)stow. Here you’re pointing Stow at the “current directory” within that stow directory—i.e. everything under `~/dev/environment/home/`.

* `-t ~`
  **Target directory**: where the symlinks will be placed. In this case, your real home directory, `~`.

* `-R`
  **Restow**: first remove any existing symlinks that were created for this package, then recreate them. This is handy if you’ve updated or moved files in the source tree.

* `-v`
  **Verbose**: print out each remove/link operation as it happens.

---

**What happens when you run it**

1. Stow looks in `~/dev/environment/home` for the package “.” (i.e. itself).
2. It removes any existing symlinks in `~/` that were previously created for that package.
3. It walks the directory tree under `~/dev/environment/home`, and for each file or folder, it creates a corresponding symbolic link in your home directory.

   * e.g. if you have `~/dev/environment/home/.bashrc`, Stow will symlink

     ```
     ~/.bashrc → ~/dev/environment/home/.bashrc
     ```
4. Because of `-v`, you’ll see each remove/create step printed to your terminal.

In short: **you’re “re-stowing” (refreshing) your entire config tree from `~/dev/environment/home` into your real `~` via symlinks**, keeping your home directory clean while managing everything under version control in `dev/environment/home`.

