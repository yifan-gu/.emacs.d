Yifan's Emacs Configures
===========

packages need to be installed:
* [ibus-el](http://www.emacswiki.org/emacs/IBusMode)

  ```shell
  sudo apt-get install ibus-el
  ```
* [w3m-el-snapshot](http://www.emacswiki.org/emacs/emacs-w3m)
  
  ```shell
  sudo apt-get install w3m-el-snapshot
  ```
* some python dependencies for [jedi](http://tkf.github.io/emacs-jedi/)

  ```shell
  cd ./lisp/emacs-jedi
  make requiremets
  sudo pip install -r requirements.txt
  ```
* [CEDET](http://cedet.sourceforge.net/) may need reinstallation

* org-mode: [ditaa](http://ditaa.sourceforge.net/)
  ```shell
  sudo apt-get install ditaa
  ```
* Latex: [auctex](https://www.gnu.org/software/auctex/)
  ```shell
  sudo apt-get install auctex
  ```
  
* go-mode
** install [gocode](https://github.com/nsf/gocode), make sure to put it into $GOROOT/bin
   
