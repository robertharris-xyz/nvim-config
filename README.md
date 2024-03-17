# Neovim Configuration

My Neovim configuration. Based off of [`kickstart.nvim`](https://github.com/nvim-lua/kickstart.nvim). 

The `<leader>` key as of writing is `<space>`.

## Installation

**Linux:**

```bash
git clone https://github.com/robertharris-xyz/nvim-config.git ~/.config/nvim
```

## Required Packages

```bash
neovim >= 0.8.3
ripgrep
fd
npm
```

A valid custom font also needs to be installed from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) to get icons to work.

- Currently using: [BlexMono Propo Text](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/IBMPlexMono).

### Windows-specific Setup

As one might expect, Neovim is a bit more annoying to set up on Windows. Here's a list of some of the stuff that needs to be done:

1. Extract the Github release zip file of Neovim to a location like: `C:\Users\<USER>\nvim`

2. Git clone this configuration to the appropriate directory:

```sh
git clone https://github.com/robertharris-xyz/nvim-config.git C:\Users\<USER>\AppData\Local\nvim
```

3. Add `C:\Users\<USER>\nvim` to the user's `%PATH%` environment variable. This is typically done through Windows Control Panel.

4. Get [the better Windows terminal](https://github.com/microsoft/terminal).
    - **Optional:** Change the opacity of the terminal to 95% and the background colour to `#272822`. This makes the theme look better. Or change `transparent_bg` to `false` in `lua/robertharris-xyz/packages.lua`.

5. Install the required packages through `winget` (if it is hopefully available, otherwise you'll need to do this manually:

```sh
winget install BurntSushi.ripgrep.MSVC
winget install sharpdp.fd
```

6. [Download npm](https://nodejs.org/en/download/)

7. Get a valid C Compiler. You can get the MinGW installation manager (basically gcc), but Clang is apparently better for Windows? This needs to be tried out at some point...
    - If choosing MinGW route, download the installation manager [here](https://sourceforge.net/projects/mingw/files/latest/download).
    - When done with the setup, in the installation manager choose the `mingw32-base` and `mingw32-gcc-g++` options.
    - To install the chosen options, go to "Installation -> Apply Changes".

## Custom Commands

- Automatically format text in a file: `:Format`
- View Markdown preview: `:MarkdownPreview`. 
- Generate Markdown Table of Contents:
    - Github Flavoured Markdown: `:GenTocGFM`.
    - Gitlab Flavoured Markdown: `:GenTocGitlab`.
- Update the Markdown Table of Contents: `:UpdateToc`.
- Remove the Markdown Table of Contents: `:RemoveToc`.

## Godot Support

Godot support is inside this configuration, however a few things have to be done manually in order to get it working. This is based off the information in [the `vim-godot` Github repository]:

1. In Godot, open Menu `Editor/Editor Settings/General/External`.
    1. Tick `Use external editor`.
    2. In `Exec Path`, add the Neovim executable path.
    3. In `Exec Flags`, add the following: `--server ./godothost --remote-send "<C-\><C-N>:n {file}<CR>{line}G{col}|"`
2. Add the `nvimgd` script in this repository to a location in `$PATH`:
    - For example: `/usr/local/bin/nvimgd`

To use Neovim with Godot, run the `nvimgd` script from within a Godot project (where the `project.godot` file is located). You should ensure that the Godot editor is running *before* running Neovim.

With this enabled, clicking scripts in Godot will open them in a new buffer in Neovim.

## Known Issues

- `iamcco/markdown-preview.nvim` plugin is a bit of a pain to get working. As of writing, the solution to the problem was mentioned here: [https://github.com/iamcco/markdown-preview.nvim/issues/558#issuecomment-1677712446](https://github.com/iamcco/markdown-preview.nvim/issues/558#issuecomment-1677712446)
    - "I discovered the error, I needed to manually run `npm install` in the plugin folder `cd ~/.local/share/nvim/lazy/markdown-preview.nvim`".
- An error might be received with treesitter's ability to parse the bash scripting language.
    - Solution is to execute: `:echo nvim_get_runtime_file('parser', v:true`. If the output received has two parsers (e.g. one of them is the default nvim parser `/usr/local/lib/nvim/parser`), rename the unneeded one, and the error should go away on subsequent boots of Neovim.
- For some reason, running `:GodotRunFZF` results in an error claiming that `fzf` is not installed, even when it is. I'm not sure what causes this issue...

