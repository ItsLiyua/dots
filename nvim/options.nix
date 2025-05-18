{
	programs.nixvim = {
		enable = true;
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
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

	 		splitright = true;
	 		splitbelow = true;

 			conceallevel = 2;
 			concealcursor = "";

 			scrolloff = 10;
 			sidescrolloff = 20;

 			cursorline = true;
			
 			autoread = true;

    foldmethod = "indent";
    foldlevel = 100;
		 };
	};
}
