return {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        ensure_installed = {
            "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc", "rust", 'regex', "php", "blade"
        },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
            enable = true,
            -- Some languages depend on vim"s regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<M-space>", -- set to `false` to disable one of the mappings
                node_incremental = "<M-space>",
                scope_incremental = false,
                node_decremental = "<Backspace>",
            },
        },
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
                    ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
                    ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    -- You can also use captures from other query groups like `locals.scm`
                    ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                },
            },
            swap = {
              enable = true,
              swap_next = {
                ["<leader>xs"] = { query = "@parameter.inner", desc = "Swap the node under the cursor with the next" },
              },
              swap_previous = {
                ["<leader>xS"] = { query = "@parameter.inner", desc = "swap the node under the cursor with the previous" },
              },
            },
        },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
