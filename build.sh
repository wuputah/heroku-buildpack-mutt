VERSION=1.5.21
PREFIX='/app/mutt'
MAILDIR='/app/Mail'
CONFIGURE="./configure --enable-imap --prefix=$PREFIX --with-mailpath=$MAILDIR"

curl "ftp://ftp.mutt.org/mutt/devel/mutt-$VERSION.tar.gz" >mutt.tar.gz
tar xzf mutt.tar.gz
rm mutt.tar.gz
vulcan build -v -n mutt -s mutt-$VERSION -o $PWD/mutt.tgz -p $PREFIX -c "mkdir $MAILDIR && $CONFIGURE && make && make install"
rm -rf mutt-$VERSION
