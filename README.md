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
  cd ./lisp/emacs-jedi;
  make requiremets;
  sudo pip install -r requirements.txt
  ```
