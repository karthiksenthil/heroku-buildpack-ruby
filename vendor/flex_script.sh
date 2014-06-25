mktmpdir() {
  dir=$(mktemp -t fakesu-$1-XXXX)
  rm -rf $dir
  mkdir -p $dir
  echo $dir
}

FLEX_BUILD="$(mktmpdir flex)"

echo "-----> Fetching and installing flex"
cd $FLEX_BUILD
curl -O -L http://sourceforge.net/projects/flex/files/flex/flex-2.5.35/flex-2.5.35.tar.bz2 >/dev/null 2>&1
tar jxvf flex-2.5.35.tar.bz2 >/dev/null 2>&1
ls -a >/dev/null 2>&1
cd flex-2.5.35
./configure
make
make install
echo "flex installed"