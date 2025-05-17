{
	programs.nixvim = {
		enable = true;
		globals.mapleader = " ";
		opts = {
			autoindent = true;
			tabstop = 2;
			softtabstop = 2;
			shiftwidth = 2;
			expandtab = true;

			number = true;
			relativenumber = true;

			wrap = false;

			ignorecase = true;
			smartcase = true;

			termguicolors = true;
			background = "dark";
			signcolumn = "yes";

			backspace = "indent,eol,start";

			clipboard = "unnamedplus";

			splitright = true;
			splitbelow = true;

			conceallevel = 2;
			concealcursor = "";

			scrolloff = 10;
			sidescrolloff = 20;

			cursorline = true;
			
			autoread = true;
		};
	};
}
