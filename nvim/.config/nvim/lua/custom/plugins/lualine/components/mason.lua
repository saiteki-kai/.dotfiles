local async = require("plenary.async")

local M = {}

-- TODO: check if there is a scheduler of the checker like lazy
M.checked = false

local function has_new_version(pkg, callback)
    pkg:check_new_version(function(success, _)
        callback(success)
    end)
end

M.get_update_count = function()
    local updates = 0
    local installed_packages = require("mason-registry").get_installed_packages()

    async.void(function()
        local tasks = {}

        for _, pkg in pairs(installed_packages) do
            table.insert(tasks, function()
                has_new_version(pkg, function(success)
                    if success then
                        updates = updates + 1
                    end
                end)
            end)
        end

        async.util.join(tasks)
    end)()

    return updates
end

M.component = {
    icon = "",
    function()
        return M.get_update_count()
    end,
    cond = function()
        return not M.checked
    end,
    on_click = function()
        vim.cmd("Mason")
    end,
}

return M
