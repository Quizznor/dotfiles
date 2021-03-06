# A collection of my dotfiles

Here you find configurations and scripts that I am using on my archlinux system. 
As I've grown quite fond of this setup I intend to save it online in case I inevitably screw something up again.
You are of course welcome to recreate my setup, but don't expect it to work out of the box. If you find mistakes 
or have suggestions to this repository please let me know.

## What you get

I am mostly using this setup for university work. This is reflected in the features I implemented. 

I use Atom for coding and vim for writing LaTeX documents, the workflow for these programs is heavily streamlined. 

There's not much else, really. Below is a list of the most important features that I use on a daily basis.

* A todo script. Tasks can be added based on importance, open tasks are displayed in a conky on workspace-1.
* Polybar with interactive powermenu, update notificator, calendar and a system tray for battery and wifi status.
* Automatic setup and formatting for specific workspaces, these include a browser-, coding-, and writing workspace. 
* vim LaTeX functionalities, including building and previewing of the final pdf. Snippets for important commands.
* A music/video workspace taylored around mpv, the script i use to download music is located [in this repo](https://github.com/Quizznor/music).

## How you get it

I am assuming you have already set up archlinux, github and yay

1. Clone this repo to your local files

`git clone https://www.github.com/Quizznor/dotfiles.git`

2. Download the required packages, update your system just in case

`cd dotfiles/ && yay -S $(cat pkglist) && yay -Syu`

3. Copy the relevant features into your own config files. If you're unsure how to do this feel free to open an issue.

---

## Images

Here's a couple of screenshots of what my setup looks like

Workspace 1 - Main terminal and todo list
![workspace-1](https://user-images.githubusercontent.com/27953725/103142326-b446a480-4701-11eb-9f6b-6c1126f92c20.png)

Workspace 2 - Browser
![workspace-2](https://user-images.githubusercontent.com/27953725/103142327-b7da2b80-4701-11eb-8987-a60fb2c99735.png)

Workspace 3 - Coding with Atom
![workspace-3](https://user-images.githubusercontent.com/27953725/103142328-b9a3ef00-4701-11eb-8ded-ca9142547f02.png)

Workspace 4 - Vim LaTeX writing and previewing with Zathura
![workspace-4](https://user-images.githubusercontent.com/27953725/103142329-ba3c8580-4701-11eb-8ed1-a65e33a9b871.png)

Workspace 5 - mpv media player coupled with ranger and vis
![workspace-5](https://user-images.githubusercontent.com/27953725/111333610-2381c400-8673-11eb-895b-3ab2ef1a11df.png)
