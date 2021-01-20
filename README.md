# dotfiles

## Credits

Originally based on/inspired by the following dotfiles, then tweaked to setup my environment.

- https://github.com/creasty/dotfiles
- https://github.com/mathiasbynens/dotfiles
- https://github.com/holman/dotfiles
- https://github.com/dikiaap/dotfiles
- https://github.com/ajh17/dotfiles
- https://github.com/izumin5210/dotfiles

## Installation

```sh
$ git clone --recursive git@github.com:antonve/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ ./install
```

## Filter what to provision
```sh
# Example which only runs homebrew
$ ./install --tag homebrew
```

## Not yet automated

- Install kotlin language server automatically: https://github.com/neoclide/coc.nvim/wiki/Language-servers#kotlin
> Using [kotlin-language-server](https://github.com/fwcd/kotlin-language-server)
>
> 1. Download server.zip from the [releases page](https://github.com/fwcd/kotlin-language-server/releases).
> 2. Unzip the file in a convenient directory, for example inside `~/lsp/kotlin/`.
>
> ```jsonc
>"languageserver": {
>  "kotlin": {
>    "command": "~/lsp/kotlin/server/bin/kotlin-language-server",
>    "filetypes": ["kotlin"]
>  }
>}
>```
