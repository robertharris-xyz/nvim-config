# Neovim Configuration

My neovim configuration. Based off of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). 

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

## Custom Commands

- Automatically format text in a file: `:Format`
- View Markdown preview: `:MarkdownPreview`. 
- Generate Markdown Table of Contents:
    - Github Flavoured Markdown: `:GenTocGFM`.
    - Gitlab Flavoured Markdown: `:GenTocGitlab`.
- Update the Markdown Table of Contents: `:UpdateToc`.
- Remove the Markdown Table of Contents: `:RemoveToc`.

## Known Issues

- `iamcco/markdown-preview.nvim` plugin is a bit of a pain to get working. As of writing, the solution to the problem was mentioned here: [https://github.com/iamcco/markdown-preview.nvim/issues/558#issuecomment-1677712446](https://github.com/iamcco/markdown-preview.nvim/issues/558#issuecomment-1677712446)
    - "I discovered the error, I needed to manually run `npm install` in the plugin folder `cd ~/.local/share/nvim/lazy/markdown-preview.nvim`".
- An error might be received with treesitter's ability to parse the bash scripting language.
    - Solution is to execute: `:echo nvim_get_runtime_file('parser', v:true`. If the output received has two parsers (e.g. one of them is the default nvim parser `/usr/local/lib/nvim/parser`), rename the unneeded one, and the error should go away on subsequent boots of neovim.

