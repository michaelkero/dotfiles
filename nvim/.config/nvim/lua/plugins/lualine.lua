local function selectionCount()
    local wc = vim.fn.wordcount()
    if wc["visual_words"] then -- text is selected in visual mode
        return wc["visual_words"] .. " Words/" .. wc['visual_chars'] .. " Chars (Vis)"
    else -- all of the document
        return wc["words"] .. " Words"
    end
end

return {
    "nvim-lualine/lualine.nvim",
    config = function ()
        require('lualine').setup {
            options = { theme = 'nord' },
            sections = {
                lualine_z = {
                    'location',
                    { selectionCount },
                },
            },
        }
    end
}

