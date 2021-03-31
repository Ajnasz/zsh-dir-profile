# ZSH Directory profile

ZSH plugin loads the configured scripts when entering into the specified directory

Ideal to set environment variables automatically.

## Configuration

Add the configuration to your .zshenv (or .zshrc) file:

```sh
typeset -A _zsh_dir_profiles
_zsh_dir_profiles=(
	"/path/to/a/directory/src/project1" "/path/to/zsh-dirprofiles/project1"
	"/path/to/a/directory/src/project2" "/path/to/zsh-dirprofiles/project2"
	"default" "/path/to/zsh-dirprofiles/default"
	)
```

Content of `/path/to/zsh-dirprofiles/project1`
```sh
export AWS_PROFILE="project1"
```

Content of `/path/to/zsh-dirprofiles/project2`
```sh
export AWS_PROFILE="project2"
```

Content of `/path/to/zsh-dirprofiles/default`
```sh
export AWS_PROFILE="default"
```

When you `cd` to `/path/to/a/directory/src/project1`, the project1 configuration will be loaded which sets the `AWS_PROFILE` environment variable to `project1`.

When you `cd` to `/path/to/a/directory/src/project2`, the project2 configuration will be loaded which sets the `AWS_PROFILE` environment variable `project2`.

When you enter to a directory which doesn't match to any other, the `default` will be loaded.

### oh-my-zsh

Put/clone the plugin into your `$ZSH_CUSTOM/plugins` folder (`$HOME/.oh-my-zsh/custom/plugins` by default).
Add the zsh-dir-profile plugin to the `plugins` list in your `zshrc`.

```sh
plugins=(zsh-dir-profile)
```
