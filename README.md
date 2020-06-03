# kubetail
Utility bash script that enables you to follow and grep logs from multiple k8s pods in one stream. It also ships with autocompletion feature which list all available pods in current k8s context that you can use.

## Instalation
Download the [kubetail](https://raw.githubusercontent.com/bulivlad/kubetail/master/kubetail) script and it's ready to use. For auto completion feature you will also need to download and source completion [script](https://github.com/bulivlad/kubetail/tree/master/completion).
Another way is to clone the github repository and use the script.

## Completion
Completion is only available for suggesting arguments (--pods --tail --label --grep) and for values for --pods argument
### If you are using bash as main shell run
* cd into completion folder
* run
```
source ./kubetail.bash
```
* cd into root folder and run
```
install ./kubetail /usr/local/bin/kubetail
```

### If you are using zsh as main shell run
* cd into completion folder
* run
```
autoload bashcompinit
bashcompinit
source ./kubetail.bash
```
* cd into root folder and run
```
install ./kubetail /usr/local/bin/kubetail
```

## Usage
* To follow logs by pods name
```
kubetail --pods <pods name separated by space>
```

* To follow logs by pods labels
```
kubetail --label '<pods label in k8s format>'
```

* To follow logs and grep for info
```
kubetail [--pods <pods name separated by space>] [--label '<pods label in k8s format>'] --grep <grep expression>
```

* To follow logs with specified tail
```
kubetail [--pods <pods name separated by space>] [--label '<pods label in k8s format>'] --tail <last number of rows>
```

*NOTE:* when supplying both --pods and --label arguments, only --pods will be considered

### Contributing

* Pull requests are welcome.
* PRs should target the `master` branch.

### Author

Vlad Bulimac (buli.vlad@gmail.com)
