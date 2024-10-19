#!/bin/bash

current_dir=$(pwd)

sudo cp -ar "$current_dir" /usr/lib/

echo -e '#!/bin/bash\n/usr/lib/codex/main.py' | sudo tee -a /usr/bin/codex> /dev/null
sudo chmod +x /usr/bin/codex

sudo cp /usr/lib/codex/codex.desktop /usr/share/applications
sudo chmod +x /usr/share/applications/codex.desktop

echo "Installation complete."
