if [ ! -d "../yangchen2.github.io" ]; then
  echo "This deploy script assumes very little of you"
  echo "But one thing it does assume"
  echo "Is that there is a directory alongside this project"
  echo "Called yangchen2.github.io"
  echo "i.e. if you perform ls .."
  echo "it should print the name of the current directory alongside"
  echo "a directory called yangchen2.github.io"
  echo "I SAID GOOD DAY"
  exit 1
fi

if [ ! -d "../source-yangchen2.github.io" ]; then
  echo "Ensure this directory is called source-yangchen2.github.io"
  exit 1
fi

# hugo build
rm -rf public
hugo
git add --all
git commit -m "Check-pointing deploy"
git push

pushd ../yangchen2.github.io || exit
  rm -rf ./*
  cp -rf ../source-yangchen2.github.io/public/ ./
  git add --all
  git commit -m "Deploy"
  git push
popd
