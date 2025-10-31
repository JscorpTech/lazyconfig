-- lua/plugins/docstring_doge.lua
return {
  "kkoomen/vim-doge",
  config = function()
    -- Sozlamalar (agar istasangiz o‘zgartiring)
    vim.g.doge_enable_mappings = 1
    vim.g.doge_mapping = "<Leader>d"
    -- Masalan, Python uchun doc standardini google style qilib qo‘ysak
    vim.g.doge_doc_standard_python = "google"
  end,
}
