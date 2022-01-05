Emacs(24.3.1) Configuration
===========

###required packages

* [ibus-el](http://www.emacswiki.org/emacs/IBusMode)

  ```shell
  $ sudo apt-get install ibus-el
  ```
  
* [w3m-el-snapshot](http://www.emacswiki.org/emacs/emacs-w3m)

  ```shell
  $ sudo apt-get install w3m-el-snapshot
  ```
  
* some python dependencies for [jedi](http://tkf.github.io/emacs-jedi/)

  ```shell
  $ cd ./lisp/emacs-jedi
  $ make requiremets
  $ sudo pip install -r requirements.txt
  ```
  
* [CEDET](http://cedet.sourceforge.net/) may need reinstallation

  ```shell
  $ cd ./lisp/cedet-1.1
  $ make
  ```

* org-mode: [ditaa](http://ditaa.sourceforge.net/)

  ```shell
  $ sudo apt-get install ditaa
  ```
  
* Latex: [auctex](https://www.gnu.org/software/auctex/)

  ```shell
  $ sudo apt-get install auctex
  ```

* go-mode

  go get
  ```shell
  $ go get -u golang.org/x/tools/cmd/...
  $ go get -u github.com/rogpeppe/godef/...
  $ go get -u github.com/mdempsky/gocode
  $ go get -u golang.org/x/tools/cmd/goimports
  $ go get -u golang.org/x/tools/cmd/guru
  $ go get -u github.com/dougm/goflymake
  ```
