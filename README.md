# warp-theme-nvim
a neovim plugin to import warp terminal themes to neovim, using warp's [yaml theme files](https://docs.warp.dev/appearance/custom-themes). 

now your nvim environment and terminal can match 😍

## setup
### with a local warp theme file 
warp allows users to define custom themes! these themes often live in `~/.warp/themes`. to use them with this plugin, provide the path to the desired theme as the `theme_link`. 

```
return {
    'liliwilson/warp-theme-nvim',
    config = function()
        require('warp-theme-nvim').setup({
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
        require('warp-theme-nvim').setup({
            theme_link = "https://raw.githubusercontent.com/warpdotdev/themes/refs/heads/main/warp_bundled/gruvbox_dark.yaml"
        })
    end
}
```

## pretty examples

### hackmit 2024 theme

<img width="1552" alt="image" src="https://github.com/user-attachments/assets/9aa754c2-6e97-42fe-b30d-88b390f33284">
<img width="1552" alt="image" src="https://github.com/user-attachments/assets/2abdb6f2-8672-48c8-bb08-bb80df592c5b">

### jellyfish warp theme

<img width="1552" alt="image" src="https://github.com/user-attachments/assets/aa9eb19c-2c71-4edf-b01a-5e2e77bd7644">
<img width="1552" alt="image" src="https://github.com/user-attachments/assets/71711555-2923-4de4-af6d-c21f66432efc">

### cyber wave warp theme

<img width="1552" alt="image" src="https://github.com/user-attachments/assets/79c37a3e-ee26-4c54-af97-975944f40465">
<img width="1552" alt="image" src="https://github.com/user-attachments/assets/ccd69453-6d8d-4259-896f-efb66534f270">



