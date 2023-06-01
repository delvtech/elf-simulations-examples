yum install sqlite-devel.x86_64 -y
yum install -y xz-devel -y
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "(pyenv init -)"' >> ~/.bashrc

source ~/.bashrc

pyenv install 3.9
pyenv local 3.9
which python
python -m venv .venv
source .venv/bin/activate
python --version
which python3
python -m ensurepip
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
