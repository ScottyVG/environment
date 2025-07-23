# Packages

## Change hostname

```sh
sudo vi /etc/hostname
```

### Shipnames
* USS Enterprise (Various iterations including NCC-1701, D, E): Perhaps the most famous spaceship in fiction, the Enterprise has been the flagship for several series and movies, captained by legendary figures like Kirk and Picard. The original NCC-1701 was a Constitution-class heavy cruiser launched in 2245. Subsequent versions like the Enterprise-D (Galaxy-class) and Enterprise-E (Sovereign-class) have appeared in different eras.
* USS Voyager (NCC-74656): An Intrepid-class starship renowned for its seven-year journey back to the Alpha Quadrant after being stranded in the Delta Quadrant, according to Alpha Command Wiki.
* USS Defiant (NX-74205): A smaller, more maneuverable ship designed for combat and a key vessel in the Dominion War, according to Mahannah's Sci-fi Universe.
* USS Discovery (NCC-1031): A Crossfield-class starship equipped with a unique spore drive, allowing for nearly instantaneous travel across vast distances, notes Mahannah's Sci-fi Universe.
* USS Excelsior (NCC-2000): An advanced Federation ship known for its experimental transwarp drive, playing a significant role in various missions.
* USS Stargazer (NCC-2893): Notably, Jean-Luc Picard's first command. 
* USS Monitor: While not a Starfleet ship, a monitor ship class is featured in Star Trek Online, according to a Reddit thread. A "monitor" suggests observation and communication, perfect for a server you'll be checking in on remotely.
* USS Relay: While no known Starfleet ship bears this exact name, the concept of a "relay" is central to communication systems in Star Trek. It represents a point of connection and transmission.
* USS Pathfinder: The Pathfinder-class long-range science vessel in Star Trek Online suggests a vessel that finds and establishes paths, mirroring the way your server connects you remotely to your Arch Linux instance.
* USS Intrepid: The Intrepid-class starship USS Voyager was known for its long-range exploration and successful communication back to the Alpha Quadrant, making it a strong symbol for a reliable remote connection.
* USS Communicator: While a bit on the nose, it directly refers to the function of remote communication, according to Wikipedia.

## Sort Package Names in NeoVim

```
:sort
```

## Paru

(PARU - Feature packed AUR helper)[https://github.com/Morganamilo/paru]

### Installation

```sh
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

## ZSH

1. Install Zsh (if you haven’t already)
```bash
sudo pacman -Syu zsh
```
2. (Optional) Install Oh My Zsh
If you want the Oh My Zsh framework (and you already have a ~/.zshrc, skip the install-script step and just make sure you have ~/.oh-my-zsh in your home):

```bash
sudo paru -S oh-my-zsh-git
```
3. Try Zsh right now
To drop into Zsh in your current session:

```bash
exec zsh -l
```
This replaces Bash with a login Z shell (-l), which will read ~/.zshrc (and Oh My Zsh) normally.

4. Make Zsh your default login shell
So you don’t have to type anything next time:

Verify /usr/bin/zsh is listed in /etc/shells:

```bash
grep -x '/usr/bin/zsh' /etc/shells
```
Change your shell:

```bash
chsh -s /usr/bin/zsh
```
Log out (or close your SSH session) and log back in. You’ll land directly in Zsh.

