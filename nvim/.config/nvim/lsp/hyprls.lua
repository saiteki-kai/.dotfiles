-- vim.filetype.add({
--     pattern = {
--         [".*/hypr/**/.*%.conf"] = "hyprlang"
--     }
-- })

---@type vim.lsp.Config
return {
    cmd = { "hyprls", "--stdio" },
    filetypes = { "hyprlang" },
    root_markers = { ".git" }
}
