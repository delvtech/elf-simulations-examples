yum install sqlite-devel.x86_64 -y
yum install -y xz-devel -y
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
export PATH="$HOME/.pyenv/bin:$PATH"
pyenv install 3.9
pyenv local 3.9
export PYENV_ROOT="$HOME/.pyenv"
eval "(pyenv init -)"
which python3
python3 -m venv .venv
source .venv/bin/activate
python3 --version
which python3
python3 -m ensurepip
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
