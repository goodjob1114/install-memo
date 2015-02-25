#!/bin/bash

sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

# github URL => https://github.com/fesplugas/rbenv-installer
curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

bashrc_path=~/.bashrc

echo "export RBENV_ROOT=\"\${HOME}/.rbenv\"" >> $bashrc_path
echo "if [ -d \"\${RBENV_ROOT}\" ]; then" >> $bashrc_path
echo "export PATH=\"\${RBENV_ROOT}/bin:\${PATH}\"" >> $bashrc_path
echo "eval \"\$(rbenv init -)\"" >> $bashrc_path
echo "fi" >> $bashrc_path

exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> $bashrc_path
exec $SHELL

rbenv install 2.1.5
rbenv global 2.1.5
ruby -v

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
