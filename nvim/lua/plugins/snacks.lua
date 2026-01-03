return {
  "folke/snacks.nvim",
  event = "VimEnter",
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
      ]],
      },
      sections = {
        { section = 'header' },
        { section = "keys", indent = 1,gap = 1, padding = 1 },
        { section = 'recent_files', icon = ' ', title = 'Recent Files', cwd = true, indent = 3, padding = 2 },
        -- { icon = " ", title = "Projects", section = "projects", indent = 3, padding = 2 },
        { section = "startup" },
        { pane = 2, padding = 2 },
        {
          pane = 2,
          section = "terminal",
          -- cmd = "~/.config/nvim/img/ascii-image-converter ~/.config/nvim/img/CodeOpsHQLogoWithLightBackgraung.jpg -c -b --dither",
          cmd = "~/.config/nvim/img/ascii-image-converter ~/.config/nvim/img/logo.jpg -c -b --dither",
          random = 10,
          indent = 4,
          height = 30,
        }
      },
    },
    -- explorer = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    -- input = { enabled = true },
    lazygit = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    -- git = { enabled = true },
    quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    scratch = { enabled = true },
    -- statuscolumn = { enabled = true },
    terminal = { enabled = true },
    -- toggle = { enabled = true },
    -- words = { enabled = true },
  },
  keys = {
    { "<leader>lg", function() Snacks.lazygit() end, desc = "[L]azy[G]it" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal", mode = {"n", "t"} },
    { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },

    -- Picker key maps
    { "\\", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader>ss", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader><space>", function() Snacks.picker.buffers() end, desc = "[ ] Find existing buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "[S]earch by [G]rep" },
    { "<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[S]earch [N]eovim files" },
    { "<leader>sf", function() Snacks.picker.files() end, desc = "[S]earch [F]iles" },
    { "<leader>sp", function() Snacks.picker.pickers() end, desc = "[S]earch [P]ickers" },
    { "<leader>s.", function() Snacks.picker.recent() end, desc = "[S]earch Recent Files ('.' for repeat)" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[S]earch [K]eymaps" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "[S]earch current [W]ord", mode = { "n", "x" } },
    { "<leader>sr", function() Snacks.picker.resume() end, desc = "[S]earch [R]esume" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "[S]earch [D]iagnostics" },
    { "<leader>s/", function() Snacks.picker.grep_buffers() end, desc = "[S]earch [/] in Open Files" },
    {
      "<leader>/",
      function()
        Snacks.picker.lines({
          -- use the Select layout
          layout = {
            preset = "select",                     -- ⟵ preset defined in docs :contentReference[oaicite:0]{index=0} 
          },
        })
      end,
      desc = "[/] Fuzzily search in current buffer",
    },
  }
}
