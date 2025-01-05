return {
    "filetype",
    fmt = function(str)
        return str:gsub("^%l", string.upper)
    end
}
