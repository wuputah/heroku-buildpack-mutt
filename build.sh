VERSION=1.5.21
PREFIX='/app/local'
MAILDIR='/app/Mail'
CONFIGURE="./configure --enable-imap --prefix=$PREFIX --with-mailpath=$MAILDIR"

curl "ftp://ftp.mutt.org/mutt/devel/mutt-$VERSION.tar.gz" >mutt.tar.gz
tar xzf mutt.tar.gz
rm mutt.tar.gz
vulcan build -v -n mutt -s mutt-$VERSION -o $PWD/mutt.tgz -p $PREFIX -c "mkdir $MAILDIR && $CONFIGURE && make && make install"
rm -rf mutt-$VERSION

curl "ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2" >vim.tar.bz2
tar xjf vim.tar.bz2
rm vim.tar.bz2
vulcan build -v -n vim -s vim73 -o $PWD/vim.tgz -p $PREFIX -c "./configure --prefix=$PREFIX && make && make install"
rm -rf vim73
