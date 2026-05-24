return {
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("vesper")
      vim.api.nvim_set_hl(0, "Normal", { bg = "#252525" })   -- match kitty bg
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a0f00" }) -- float windows
    end,
  },
  {
    "yorickpeterse/vim-paper",
    lazy = false,
    priority = 1000,
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    priority = 999,          -- ✅ just below colorscheme priority
    dependencies = {
      "datsfilipe/vesper.nvim", -- ✅ explicit load order
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          icons_enabled = true,
          globalstatus = true,
        },
      })
    end,
  },
}
