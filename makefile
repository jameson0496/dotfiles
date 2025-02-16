# Inspiration and code from:
# https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html
# https://github.com/venthur/dotfiles/blob/master/makefile
all:
	stow --verbose --target=$$HOME --restow */
