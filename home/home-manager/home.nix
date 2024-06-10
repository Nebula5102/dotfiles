{ config, pkgs, lib, ... }:
{
    home.username = "nicklausb";
    home.homeDirectory = "/home/nicklausb";
    home.stateVersion = "23.11"; 

    home.packages = with pkgs; [
        neofetch
        kitty

		#LSPs
		lua-language-server # Lua
		rnix-lsp # Nix
		nodePackages_latest.pyright # Python
		rust-analyzer # Rust
		# ccls # C not yet fully implemented TODO
    ];

    home.file = {};
    home.sessionVariables = {};

	nixpkgs = {
		overlays = [
			(final: prev: {
				vimPlugins = prev.vimPlugins // {
					NixNord = prev.vimUtils.buildVimPlugin {
						name = "NixNord";
						src = ./NixNord;
					};
				};
			})
		];
	};
    programs = {

        home-manager.enable = true;
		
		#---------------#
		#  Fish Config  #
		#---------------#
        
		fish = { 
            enable = true;
            interactiveShellInit = ''
            set fish_greeting # Disable greeting

            alias tog="$HOME/./toggle.sh"
            alias neo="neofetch"
            '';
        };

		#-----------------#
		#  NeoVim Config  #
		#-----------------#

        neovim = 
		let
			toLua = str: "lua << EOF\n${str}\nEOF\n";
			toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
			fromGitHub = ref: repo: pkgs.vimUtils.buildVimPlugin {
				pname = "${lib.strings.sanitizeDerivationName repo}";
				version = ref;
				src = builtins.fetchGit {
					url = "https://github.com/${repo}.git";
					ref = ref;
				};
			};
		in
		{
            enable = true;
            defaultEditor = true;
            viAlias = true;
            vimAlias = true;
        	vimdiffAlias = true;

			extraLuaConfig = ''
				${builtins.readFile ./nvim/options.lua}
				
				--vim.defer_fn(function()
				--	vim.cmd [[
				--		luafile ./nvim/plugin/lsp.lua
				--	]]
				--end, 70)
	    	'';
			plugins = with pkgs.vimPlugins; [
				{
					plugin = (fromGitHub "HEAD" "rktjmp/lush.nvim");
				}
				{
					plugin = (fromGitHub "HEAD" "rktjmp/shipwright.nvim");
				}
				{
					plugin = NixNord;
					config = "colorscheme NixNord";
				}
				{
					plugin = (nvim-treesitter.withPlugins (p: [
						p.tree-sitter-nix
						p.tree-sitter-vim
						p.tree-sitter-lua
						p.tree-sitter-python
						p.tree-sitter-json
						p.tree-sitter-bash
						p.tree-sitter-rust
						p.tree-sitter-typescript
						p.tree-sitter-c
					]));
					config = toLuaFile ./nvim/plugin/tree-sitter.lua;
				}
				{
					plugin = nvim-lspconfig;
					config = toLuaFile ./nvim/plugin/lsp.lua;
				}
				{
					plugin = nvim-compe;
				}
			];
        };

		#------------------#
		#   Kitty Config   #
		#------------------#

        kitty = {
            enable = true;
            font.name = "JetBrainsMono Nerd Font";
            font.size = 13.0;
            shellIntegration.enableFishIntegration = true;
            settings = {
                startup_session = "launch.conf";
                #Cursor
                cursor = "#CCCCCC";
                cursor_text_color = "#111111";
                cursor_shape = "block";
                #cursor_beam_thickness 1.5
                cursor_underline_thickness = "2.0";
                cursor_blink_interval = "0.5";
                
                #URL
                url_color = "#0087BD";
                url_style = "curly";
                url_prefixes = "file ftp ftps gemini git goper http https irc ircs kitty mailto new sftp ssh";
                show_hyperlink_targets = true;
                underline_hyperlinks = "hover";
                
                #Terminal Bell
                enable_audio_bell = true;
                visual_bell_duration = "0.2";
                visual_bell_color = "#FFFFFF";
                #bell_path none #Bell sound path
                
                #Window
                remember_window_size = false;
                window_border_width = "0.5pt";
                hide_window_decorations = true;
                initial_window_width = "110c";
                initial_window_height = "28c";
                
                #Colour Scheme
                foreground = "#FFCB77";
                background = "#191D24";
                background_opacity = "0.85";
                background_blur = 0;
                #background_image none
                selection_foreground = "#000000";
                selection_background = "#FFCB77";
                
                # Nordic theme:
                #Black
                color0 = "#808080";
                color8 = "#C0C8D8";
                
                #Red
                color1 = "#BF616A";
                color9 = "#B74E58";
                
                #Green
                color2 = "#A3BE8C";
                color10 = "#97B67C";
                
                #Yellow
                color3 = "#E7C173";
                color11 = "#EBCB8B";
                
                #Blue
                color4 = "#5E81AC";
                color12 = "#88C0D0";
                
                #Magenta
                color5 = "#B48EAD";
                color13 = "#A97EA1";
                
                #Cyan
                color6 = "#8FBCBB";
                color14 = "#80B3B2";
                
                #White
                color7 = "#C0C8D8";
                color15 = "#ECEFF4";
            };
        };


		#-------------------#
		#  Starship Config  #
		#-------------------#

        starship = {
            enable = true;
            settings = {
                add_newline = false;
    	        format = "[[░▒▓](#C5727A)[ 󱄅 ](bg:#C5727A fg:#FFFFFF)$username[](bg:#BE9DB8 fg:#C5727A)$directory[](bg:#81A1C1 fg:#BE9DB8)$git_branch$git_status[](bg:#EFD49F fg:#81A1C1)$rust$nodejs[](bg:#B1C89D fg:#EFD49F)$time[](fg:#B1C89D)\n$character](white)";
            	character = {
                	success_symbol = "[󰘍 ](#C5727A)";
                    error_symbol = "[󰘍 ](#EFD49F)";
            	};
            	username = {
            	    show_always = true;
            	    style_user = "bg:#C5727A fg:#FFFFFF";
            	    style_root = "bg:#C5727A fg:#FFFFFF";
            	    format = "[ $user ]($style)";
            	};
            	directory = {
            	    home_symbol = "󰋞 ";
                	format = "[ $path ](bg:#BE9DB8 fg:#FFFFFF)";
            	};
            	git_branch = {
            	    symbol = "  ";
            	    style = "bg:#81A1C1";
            	    format = "[[ $symbol $branch ](fg:#FFFFFF bg:#81A1C1)]($style)";
            	};
            	git_status = {
            	    style = "bg:#81A1C1";
            	    format = "[[ $all_status $ahead_behind ](fg:#FFFFFF bg:#81A1C1)]($style)";
            	};
            	rust = {
            	    symbol = "  ";
            	    style = "bg:#EFD49F";
            	    format = "[[ $symbol ($version) ](fg:#FFFFFF bg:#EFD49F)]($style)";
            	};
            	nodejs = {
            	    symbol = "  ";
            	    style = "bg:#EFD49F";
            	    format = "[[ $symbol ($version) ](fg:#FFFFFF bg:#EFD49F)]($style)";
            	};
            	time = {
            	    disabled = false;
            	    time_format = "%R";
            	    style = "bg:#B1C89D fg:#ffffff";
            	    format = "[  $time ]($style)";
                };
            	directory.substitutions = {
                };
            };
        };
    };
}
