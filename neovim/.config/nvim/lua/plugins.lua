-------------
-- Plugins --
------------- 
-- https://github.com/rockerBOO/awesome-neovim?tab=readme-ov-file#contents
-- https://lazy.folke.io/spec

return {
    -------------------
    -- Look and feel --
    -------------------

    { 
        "navarasu/onedark.nvim", 
        lazy = false, 
        config = function()
            vim.cmd([[colorscheme onedark]])
        end,
    },
    {
        'ojroques/nvim-hardline',
        lazy = false,
        config = function()
            require('hardline').setup{
                -- bufferline = true,                
            }
        end,
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { {'nvim-tree/nvim-web-devicons'} },
        config = function()
            -- https://www.reddit.com/r/neovim/comments/1czs9ky/adding_dashboard_colors/
            vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#61afef" })
            require('dashboard').setup {
                disable_move = true,
                config = {
                    header = { -- http://patorjk.com/software/taag/
[[                                                                                   ]],
[[      ___           ___           ___           ___                       ___      ]],
[[     /\__\         /\  \         /\  \         /\__\          ___        /\__\     ]],
[[    /::|  |       /::\  \       /::\  \       /:/  /         /\  \      /::|  |    ]],
[[   /:|:|  |      /:/\:\  \     /:/\:\  \     /:/  /          \:\  \    /:|:|  |    ]],
[[  /:/|:|  |__   /::\~\:\  \   /:/  \:\  \   /:/__/  ___      /::\__\  /:/|:|__|__  ]],
[[ /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ ]],
[[ \/__|:|/:/  / \:\~\:\ \/__/ \:\  \ /:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / ]],
[[     |:/:/  /   \:\ \:\__\    \:\  /:/  /   |:|__/:/  /  \::/__/           /:/  /  ]],
[[     |::/  /     \:\ \/__/     \:\/:/  /     \::::/__/    \:\__\          /:/  /   ]],
[[     /:/  /       \:\__\        \::/  /       ~~~~         \/__/         /:/  /    ]],
[[     \/__/         \/__/         \/__/                                   \/__/     ]],
[[                                                                                   ]],
[[                                                                                   ]],
                    },
                    disable_move = true,
                },
            }
        end,
    },

    ---------------------
    -- File Management --
    ---------------------

    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
        keys = { -- mode entry is optional and defaults to n
            { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", mode = "n", desc = "Telescope find files" }, --no_ignore=false
        },
        config = function()
            require('telescope').setup({
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
                defaults = {
                    file_ignore_patterns = {
                        "%.mozilla/", "%.thunderbird/",
                        "%.cache/", "%.conda", "%.rigsofrods", "%.tor project", "*cantera-/", "%.local/",
                        "%.pdf", "%.docx", "%.pptx", "%.xlsx", "%.odf", "%.ods", "%.odt", "%.odp",
                        "%.jpg", "%.jpeg", "%.png", "%.xcf", "%.webp", "%.heic.", "%.svg",
                        "%.mp4", "%.MP4",
                        "%.mp3",
                        "%.stl", "%.3mf", "%.blend", "%.gcode", "%.STL",
                        "%.lnk",
                    },
                },
            })
            require('telescope').load_extension('fzf')
        end,
    },
    {
        'nvim-tree/nvim-tree.lua',
        keys = {
            { "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "Open file tree" },
        },
        lazy = false,
        config = function()
            require("nvim-tree").setup({
                sort = {
                    sorter = "name",
                    folders_first = true,
                },
                view = {
                    cursorline = false, --disable cursorline in viewer
                    number = true, --enable line number
                },
                -- stopped at nvim-tree-opts-tab line 1573 
                filters = {
                    dotfiles = true,
                },
            })
        end,
    },

    -------------
    -- Utility --
    -------------

    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    { 'nvim-tree/nvim-web-devicons', },
    { -- Highlights hex codes with their color
        'brenoprata10/nvim-highlight-colors',
        event = 'VimEnter',
        config = function()
            vim.opt.termguicolors = true
            require('nvim-highlight-colors').setup({})
        end,
    },

    ------------
    -- Coding --
    ------------

    {
        "CRAG666/code_runner.nvim",
        keys = {
            -- write file then run, how fancy
            { "<leader>rc", ":w<cr><cmd>RunCode<cr>", desc = "Run current code file" },
        },
        config = function()
            require('code_runner').setup({
              filetype = {
                python = "python3 -u",
                c = function(...)
                  c_base = {
                    "cd $dir &&",
                    "gcc $fileName -o",
                    "/tmp/$fileNameWithoutExt",
                  }
                  local c_exec = {
                    "&& /tmp/$fileNameWithoutExt &&",
                    "rm /tmp/$fileNameWithoutExt",
                  }
                  vim.ui.input({ prompt = "Add more args:" }, function(input)
                    c_base[4] = input
                    vim.print(vim.tbl_extend("force", c_base, c_exec))
                    require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
                  end)
                end,
              },
              startinsert = true,
              term = {
                  position = "hor",
              },
            })
        end,
    },

    -----------
    -- Games --
    -----------

    { 'alec-gibson/nvim-tetris', cmd = "Tetris", },
    { 'seandewar/nvimesweeper', cmd = "Nvimesweeper", },
    {
        'jim-fx/sudoku.nvim',
        cmd = "Sudoku",
        config = function()
            require("sudoku").setup({})
        end,
    },

    --------------
    -- Disabled --
    --------------

    --{ -- Does not work in lua
    --    'smzm/hydrovim',
    --    dependencies = { 'MunifTanjim/nui.nvim' },    
    --},
    -- {"Th3Whit3Wolf/one-nvim", --onedark theme thats just wack
    --   lazy = false, 
    --   config = function()
    --     colorscheme = "one-nvim"
    --   end,
    -- },
    --{
    --    "vhyrro/luarocks.nvim", --not currently required
    --    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    --    config = true,
    --},
}

     --"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
     --"⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ",
     --"⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ",
     --"⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ",
     --"⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ",
     --"⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ",
     --"⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ",
     --"⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ",
     --"⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ",
     --"⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ",
     --"⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ",
     --"⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ",
     --"⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ",
     --"⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ",
     --"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
