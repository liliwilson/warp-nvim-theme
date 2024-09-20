# warp-theme-nvim
a neovim plugin to import warp terminal themes to neovim. 

## setup
### with a local warp theme file 
```
return {
    'liliwilson/warp-theme-nvim',
    config = function()
        -- path to the theme on your machine
        local theme_link = "/Users/liliwilson/.warp/themes/hack_mit_2024.yaml"
        require('warp-theme').setup(
            { theme_link = theme_link }
        )
    end
}
```


### with an online warp theme file
```
return {
    'liliwilson/warp-theme-nvim',
    config = function()
        -- github link to the theme
        local theme_link = "https://raw.githubusercontent.com/warpdotdev/themes/refs/heads/main/warp_bundled/gruvbox_dark.yaml"
        require('warp-theme').setup(
            { theme_link = theme_link }
        )
    end
}
```
