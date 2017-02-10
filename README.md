## PHPStan - PHP Static Analysis Tool - discover bugs in your code without running it!
[![Docker Pulls](https://img.shields.io/docker/pulls/rvannauker/phpstan.svg)](https://hub.docker.com/r/rvannauker/phpstan/) [![Docker Stars](https://img.shields.io/docker/stars/rvannauker/phpstan.svg)](https://hub.docker.com/r/rvannauker/phpstan/) [![](https://images.microbadger.com/badges/image/rvannauker/phpstan:latest.svg)](https://microbadger.com/images/rvannauker/phpstan:latest) [![GitHub issues](https://img.shields.io/github/issues/RichVRed/docker-phpstan.svg)](https://github.com/RichVRed/docker-phpstan) [![license](https://img.shields.io/github/license/RichVRed/docker-phpstan.svg)](https://tldrlegal.com/license/mit-license)

Docker container to install and run phpstan

### Installation / Usage
1. Install the rvannauker/phpstan container:
```bash
docker pull rvannauker/phpstan
```
2. Run phpstan through the phpstan container:
```bash
sudo docker run --rm --volume $(pwd):/workspace --name="phpstan" "rvannauker/phpstan" analyse --level=5 --no-progress --no-interaction -vvv {destination}
```

### Download the source:
To run, test and develop the PHPSTAN Dockerfile itself, you must use the source directly:
1. Download the source:
```bash
git clone https://github.com/RichVRed/docker-phpstan.git
```
2. Build the container:
```bash
sudo docker build --force-rm --tag "rvannauker/phpstan" --file phpstan.dockerfile .
```
3. Test running the container:
```bash
 $ docker run rvannauker/phpstan --help
```