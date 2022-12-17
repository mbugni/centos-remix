# centos-remix

## Purpose
This project is a CentOS Stream Remix (like a [Fedora Remix][01]) and aims to offer a complete system for multipurpose usage with localization support. You can build a live image and try the software, and then install it in your PC if you want.
Other goals of this remix are:

* common extra-repos
* multimedia apps
* office automation support (printers and scanners)
* and more...

For more info [visit the documentation page][02].

## How to build the LiveCD
[See a detailed description][03] of how to build the live media.

### Prepare the build target
Install kickstart tools:

```shell
$ sudo dnf -y install pykickstart
```

Prepare the target directory for build results:

```shell
$ sudo mkdir /result

$ sudo chmod ugo+rwx /result
```

Choose a version (eg: KDE workstation with italian support) and then create a single Kickstart file from the base code:

```shell
$ ksflatten --config /<source-path>/kickstarts/l10n/kde-workstation-it_IT.ks \
 --output /result/centos-8-kde-workstation.ks
```

### Prepare the build enviroment using Podman
Install Podman:

```shell
$ sudo dnf -y install podman
```

Create the root of the build enviroment:

```shell
$ sudo dnf -y --setopt='tsflags=nodocs' --setopt='install_weak_deps=False' \
 --releasever=8 --installroot=/result/livebuild-8 --repo=baseos \
 --repo=appstream install lorax-lmc-novirt
```

Create the container for building:

```shell
$ sudo sh -c 'tar -c -C /result/livebuild-8 . | podman import - centos/livebuild:8'
```

### Build the live image using Podman
Build the .iso image by running the `livemedia-creator` command inside the container:

```shell
$ sudo podman run --privileged --volume=/dev:/dev --volume=/result:/result \
 --volume=/lib/modules:/lib/modules -it centos/livebuild:8 \
 livemedia-creator --no-virt --nomacboot --make-iso --project='CentOS Stream' \
 --releasever=8 --tmp=/result --logfile=/result/lmc-logs/livemedia.log \
 --ks=/result/centos-8-kde-workstation.ks
```

Remove unused containers when finished:

```shell
$ sudo podman container prune
```

## Transferring the image to a bootable media
Install live media tools:

```shell
$ sudo dnf install livecd-iso-to-mediums
```

Create a bootable USB/SD device using the .iso image:

```shell
$ sudo livecd-iso-to-disk --format --reset-mbr /result/lmc-work-<code>/images/boot.iso /dev/sd[X]
```

## Post-install tasks
The Anaconda installer does not remove itself after installation. You can remove it to save space by running this command:

```shell
$ sudo dnf remove anaconda\*
```

## ![Bandiera italiana][04] Per gli utenti italiani
Questo è un Remix di CentOS Stream (analogo ad un [Remix di Fedora][01]) con il supporto in italiano per lingua e tastiera. Nell'immagine .iso che si ottiene sono già installati i pacchetti e le configurazioni per il funzionamento in italiano delle varie applicazioni (come l'ambiente grafico, la suite LibreOffice etc).
Nel sistema sono presenti anche:

* repositori extra di uso comune
* supporto per le applicazioni multimediali
* supporto per l'ufficio (stampanti e scanner)
* e altre funzionalità ancora...

### Attività post-installazione
Il programma di installazione Anaconda non rimuove se stesso dopo l'installazione. E' possibile rimuoverlo per recuperare spazio utilizzando il seguente comando:

```shell
$ sudo dnf remove anaconda\*
```

## Change Log
All notable changes to this project will be documented in the [`CHANGELOG.md`](CHANGELOG.md) file.

The format is based on [Keep a Changelog][05].

[01]: https://fedoraproject.org/wiki/Remix
[02]: https://mbugni.github.io/fedora-remix.html
[03]: https://weldr.io/lorax/lorax.html
[04]: http://flagpedia.net/data/flags/mini/it.png
[05]: https://keepachangelog.com/
