{ config, lib, pkgs, ... }: {
	users.defaultUserShell = pkgs.zsh;
	programs.zsh = {
		enable = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;
		enableCompletion = true;
	};
}
