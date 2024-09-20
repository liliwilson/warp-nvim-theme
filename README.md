# warp-theme-nvim
a neovim plugin to import warp terminal themes to neovim. 

## setup
### with a local warp theme file 
warp allows users to define custom themes! these themes often live in `~/.warp/themes`. to use them with this plugin, provide the path to the desired theme as the `theme_link`. 

```
return {
    'liliwilson/warp-theme-nvim',
    config = function()
        require('warp-theme').setup({
                theme_link = "/Users/liliwilson/.warp/themes/hack_mit_2024.yaml"
            })
    end
}
```


### with an online warp theme file
warp also ships with a ton of neat default themes! the yaml files for these themes aren't easily accessible from your machine, but they all live in [warp's theme repository](https://github.com/warpdotdev/themes) here. to use them with this plugin, provide the raw github url to the desired theme as the `theme_link`. 

```
return {
    'liliwilson/warp-theme-nvim',
    config = function()
        require('warp-theme').setup({
            theme_link = "https://raw.githubusercontent.com/warpdotdev/themes/refs/heads/main/warp_bundled/gruvbox_dark.yaml"
        })
    end
}
```
