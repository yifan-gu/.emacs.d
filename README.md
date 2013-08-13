emacs_setup
===========

my emacs setup

packages need to be installed:
* ibus-el

  ```shell
  sudo apt-get install ibus-el
  ```
* w3m-el-snapshot
  
  ```shell
  sudo apt-get install w3m-el-snapshot
  ```
* some python dependencies for jedi

  ```shell
  cd ./lisp/emacs-jedi
  make requiremets
  sudo pip install -r requirements.txt
  ```
* CEDET may need reinstallation

* org-mode
** ditaa
  ```shell
  sudo apt-get install ditaa
  ```
* Latex
** auctex
  ```shell
  sudo apt-get install auctex
  ```
  
* go-mode
** install [gocode](https://github.com/nsf/gocode)
   make sure to put it into $PATH_OF_GO/bin
   