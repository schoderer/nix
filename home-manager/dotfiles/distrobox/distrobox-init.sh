pacman -Syyu
pacman -S --needed --noconfirm git base-devel rustup helix mold
rustup default stable
rustup target add wasm32-unknown-unknown
ln -s /home/michael/.ssh ~/.ssh
mkdir -p ~/projects