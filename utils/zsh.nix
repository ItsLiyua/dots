{ config, lib, pkgs, ... }: {
	programs.zsh = {
		enable = true;
		autocd = true;
		dotDir = ".config/zsh";
		history = {
			path = "$HOME/.cache/zsh_history";
			size = 10000;
			append = true;
			saveNoDups = true;
			share = true;
			ignoreSpace = true;
		};
		shellAliases = {
			c = "clear";
			f = "fastfetch";
			v = "nvim";
			cd = "z";
		};
	};
	programs.zoxide = {
		enable = true;
		enableZshIntegration = true;
	};
	programs.oh-my-posh = {
		enable = true;
		settings = builtins.fromJSON ''
{
	"blocks": [
		{
			"type": "prompt",
			"alignment": "left",
			"newline": true,
			"segments": [
				{
					"type": "path",
					"style": "plain",
					"background": "transparent",
					"foreground": "blue",
					"template": "{{ .Path }}",
					"properties": {
						"style": "full"
					}
				},
				{
					"type": "git",
					"style": "plain",
					"foreground": "p:grey",
					"background": "transparent",
					"template": " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>",
					"properties": {
						"branch_icon": "",
						"commit_icon": "@",
						"fetch_status": true
					}
				}
			]
		},
		{
			"type": "rprompt",
			"overflow": "hidden",
			"segments": [
				{
					"type": "executiontime",
					"style": "plain",
					"foreground": "yellow",
					"background": "transparent",
					"template": "{{ .FormattedMs }}",
					"properties": {
						"threshold": 5000
					}
				}
			]
		},
		{
			"type": "prompt",
			"alignment": "left",
			"newline": true,
			"segments": [
				{
					"type": "text",
					"style": "plain",
					"foreground_templates": [
						"{{if gt .Code 0}}red{{end}}",
						"{{if eq .Code 0}}magenta{{end}}"
					],
					"background": "transparent",
					"template": "󰘧 "
				}
			]
		}
	],
	"transient_prompt": {
		"foreground_templates": [
			"{{if gt .Code 0}}red{{end}}",
			"{{if eq .Code 0}}magenta{{end}}"
		],
		"background": "transparent",
		"template": " "
	},
	"secondary_prompt": {
		"foreground": "magenta",
		"background": "transparent",
		"template": " "
	}
}
		'';
	};
}
