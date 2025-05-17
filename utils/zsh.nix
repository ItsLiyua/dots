{ config, lib, pkgs, ... }: {
	programs.zsh = {
		enable = true;
		autocd = true;
		dotDir = ".config/zsh";
		history = {
			path = ".cache/zsh_history";
			size = 10000;
		};
	};
	programs.oh-my-posh = {
		enable = true;
	};
}
