return {
    icon = "",
    function()
        local empty_msg = ''

        local clients = vim.lsp.get_clients()

        if #clients == 0 then
            return empty_msg
        end

        local active_clients = {}
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes

            if filetypes and vim.tbl_contains(filetypes, vim.bo.filetype) then
                table.insert(active_clients, client.name)
            end
        end

        if #active_clients == 0 then
            return empty_msg
        else
            return table.concat(active_clients, ', ')
        end
    end,
}

