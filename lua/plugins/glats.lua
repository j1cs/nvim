return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      {
        "L",
        function()
          vim.cmd("bnext " .. vim.v.count1)
        end,
        desc = "Next buffer",
      },
      {
        "H",
        function()
          vim.cmd("bprev " .. vim.v.count1)
        end,
        desc = "Previous buffer",
      },
      {
        "]b",
        function()
          vim.cmd("bnext " .. vim.v.count1)
        end,
        desc = "Next buffer",
      },
      {
        "[b",
        function()
          vim.cmd("bprev " .. vim.v.count1)
        end,
        desc = "Previous buffer",
      },
    },
  },
  { "navarasu/onedark.nvim" },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        exclude = {
          ".git",
          "node_modules",
        },
        sources = {
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup({
        -- manual = true,
        filetypes = {
          TelescopePrompt = false,
          ["neo-tree-popup"] = false,
          ["dap-repl"] = false,
        },
      })
      -- stylua: ignore start
      vim.keymap.set("i", "<A-f>", function() neocodeium.accept() end)
      vim.keymap.set("i", "<A-w>", function() neocodeium.accept_word() end)
      vim.keymap.set("i", "<A-a>", function() neocodeium.accept_line() end)
      vim.keymap.set("i", "<A-e>", function() neocodeium.cycle_or_complete() end)
      vim.keymap.set("i", "<A-r>", function() neocodeium.cycle_or_complete(-1) end)
      vim.keymap.set("i", "<A-c>", function() neocodeium.clear() end)
      -- stylua: ignore end
    end,
  },
  {
    "nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local neocodeium = require("neocodeium")

      opts.completion = {
        -- autocomplete = false,
      }
      -- Make codeium suggestions appear only when `nvim-cmp` menu is closed
      cmp.event:on("menu_opened", function()
        neocodeium.clear()
      end)
      cmp.event:on("menu_closed", function()
        neocodeium.cycle_or_complete()
      end)
    end,
  },
}
