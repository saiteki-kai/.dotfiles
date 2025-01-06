local async = require("plenary.async")
local mason_registry = require("mason-registry")


local M = {}

-- TODO: check if there is a scheduler of the checker like lazy
M.cached_count = -1

local function has_new_version(pkg, callback)
    pkg:check_new_version(function(success, _)
        callback(success)
    end)
end

-- Get the number of packages with available updates
M.get_update_count = function()
    local updates = 0
    local installed_packages = mason_registry.get_installed_packages()

    async.void(function()
        local tasks = {}

        for _, pkg in ipairs(installed_packages) do
            table.insert(tasks, function()
                has_new_version(pkg, function(success)
                    if success then
                        updates = updates + 1
                    end
                end)
            end)
        end

        -- Wait for all tasks to complete
        async.util.join(tasks)
        M.cached_count = updates
    end)()

    return updates
end

M.component = {
    icon = "",
    function()
        if M.cached_count ~= -1 then
            return M.cached_count
        end

        return M.get_update_count()
    end,
    cond = function()
        return M.cached_count ~= 1 
    end,
    on_click = function()
        vim.cmd("Mason")
    end,
}

return M
