## Section 5: Working with Images
* Images in Detail
* * docker image push
* * docker image pull
* * docker image inspect
* * docker system info
* * docker image inspect redis
* * docker image rm redis
* * docker image folder: ls C:\ProgramData\Docker\windowsfilter
* Uber Recap
## Section 6: Containerizing an App
* * runc: has a single purpose in life — create containers
* * containerd: Its sole purpose in life was to manage container lifecycle operations — start | stop | pause | rm....
# Docker aliases
* [Dock Life: Using Docker for All The Things!](https://nystudio107.com/blog/dock-life-using-docker-for-all-the-things)
* * alias composer='docker run --rm -it -v "$PWD":/app -v ${COMPOSER_HOME:-$HOME/.composer}:/tmp composer '
* * alias composer1='docker run --rm -it -v "$PWD":/app -v ${COMPOSER_HOME:-$HOME/.composer}:/tmp composer:1 '
* * alias node='docker run --rm -it -v "$PWD":/app -w /app node:16-alpine '
* * alias node14='docker run --rm -it -v "$PWD":/app -w /app node:14-alpine '
* * alias node12='docker run --rm -it -v "$PWD":/app -w /app node:12-alpine '
* * alias node10='docker run --rm -it -v "$PWD":/app -w /app node:10-alpine '
* * alias npm='docker run --rm -it -v "$PWD":/app -w /app node:16-alpine npm '
* * alias deno='docker run --rm -it -v "$PWD":/app -w /app denoland/deno '
* * alias aws='docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli '
* * alias ffmpeg='docker run --rm -it -v "$PWD":/app -w /app jrottenberg/ffmpeg '
* * alias yo='docker run --rm -it -v "$PWD":/app nystudio107/node-yeoman:16-alpine '
* * alias tree='f(){ docker run --rm -it -v "$PWD":/app johnfmorton/tree-cli tree "$@";  unset -f f; }; f'