# My dotfiles for macos

![Screen Shot](https://user-images.githubusercontent.com/16834522/80339982-5885fc00-8892-11ea-9212-6543c07ec7c2.png)

## Installation

### 1. Install HomeBrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### 2.Clone this repo

```
git clone https://github.com/wangzewang/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
```

### 3. Install software

Please review the Brewfile, and remove things you don’t want or need.

```
cd ~/.dotfiles && brew bundle
```

### 4. Zsh Config

zsh shoud have been installed at step3. Just change default sh to zsh.

```
chsh -s $(which zsh)
```

### 5. Fzf config

fzf should have been installed at step3. Just add fuzzy auto-completion

```
$(brew --prefix)/opt/fzf/install
```
### 6. Tmux config

tmux should have been installed at step3. Install tmux plugin manager.

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 7. Apply dotfile config

```
cd ~/.dotfiles && make install
```

### 8. Nvim config

neovim config should have been apply in step7, just open nvim with v or nvim or vim. And plugins installation should start automatically.

```
v
```

### 9. Others
config in iTerm2<br>
![image](https://user-images.githubusercontent.com/16834522/80665402-fc0e2100-8acb-11ea-8689-0631b463a31f.png)

## Usage

| short key | Description |
| --- | ----------- |
| ```dev``` | open a new tmux session.Automatic restore your last dev when exec |
|```control + w + \|``` or ```control + w + ——``` | split the window |
|```control + w ``` with ```h```,```j```,```k```,```l``` | change the pane size in tmux|
|```control + w ``` with ```<```or ```>```| switch window in tmux|
|```Escape``` then ```v``` then ```h```,```j```,```k```,```l``` then ```y``` | copy in tmux|
|```control``` with ```h```,```j```,```k```,```l```| select pane in tmux or vim |
|```tr```| nerdtree in vim|
|```tb```| tagbar in vim|
|```gd```| go to defination in vim| 
|```control```+```p```| file search in vim|
|```command```+```[```or ```]```| buffer switch in vim |
|```command```+```/```| comment in vim|
|etc||







