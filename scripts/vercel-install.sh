curl https://pyenv.run | bash
$HOME/.pyenv/bin/pyenv install 3.9
$HOME/.pyenv/bin/pyenv local 3.9
$HOME/.pyenv/bin/python -m venv .venv
source .venv/bin/activate
python3 --version
which python3
python3 -m ensurepip
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
