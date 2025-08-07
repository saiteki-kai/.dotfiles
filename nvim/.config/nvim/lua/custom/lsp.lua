vim.lsp.enable({ "lua_ls", "pylsp", "lemminx", "hyprls" })

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client == nil then
            return
        end

        if client.name == "ruff" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end

        -- Auto Completion (already done by blink)
        -- if client:supports_method("textDocument/completion") then
        --     vim.lsp.completion.enable(true, client.id, args.buf, { auto_trigger = true })
        -- end

        -- Auto-format ("lint") on save.
        if not client:supports_method("textDocument/willSaveWaitUntil") and client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end
            })
        end
    end,
    desc = "LSP Callback for attaching to buffers"
})
