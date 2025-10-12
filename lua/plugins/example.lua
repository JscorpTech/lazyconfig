-- ~/.config/nvim/lua/plugins/example.lua
return {
  -- 1️⃣ LazyVim asosiy konfiguratsiyasi
  { import = "lazyvim.plugins" },

  -- 2️⃣ Qo‘shimcha LazyVim modullar
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },

  -- 3️⃣ Qo‘shimcha rang mavzusi
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- 4️⃣ Trouble (diagnostic panel)
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
    enabled = true, -- agar istasang false qilib o‘chir
  },

  -- 5️⃣ Emoji completion qo‘shish
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- 6️⃣ Telescope sozlamalari
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- 7️⃣ LSP — Python uchun (Pyright)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },

  -- 8️⃣ Treesitter — sintaksis tahlil
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
  },

  -- 9️⃣ Lualine — status bar sozlamasi
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "💀"
        end,
      })
    end,
  },

  -- 🔟 Mason — LSP va format tool’larni avtomatik o‘rnatish
  {
    "mason-org/mason.nvim", -- yangilangan repo nomi
    opts = {
      ensure_installed = {
        "ast-grep",
        "black",
        "blade-formatter",
        "clangd",
        "django-template-lsp",
        "flake8",
        "gopls",
        "htmlbeautifier",
        "intelephense",
        "isort",
        "lua-language-server",
        "pyright",
        "rust-analyzer",
      },
    },
  },
}
