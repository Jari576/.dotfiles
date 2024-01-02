local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
    vim.notify("Wilder not loaded", vim.log.levels.ERROR)
    return
end

wilder.setup({ modes = { ':', '/', '?' } })

wilder.set_option('use_python_remote_plugin', 0)

wilder.set_option('pipeline', {
    wilder.branch(
        wilder.cmdline_pipeline({
            fuzzy = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
            debounce = 10,
        }),
        wilder.vim_search_pipeline()
    )
})

local highlighters = {
    wilder.pcre2_highlighter(),
    wilder.lua_fzy_highlighter(),
}

local highlights = {
    accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
}

local popupmenu_renderer = wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        border = 'rounded',
        pumblend = 20,
        empty_message = wilder.popupmenu_empty_message_with_spinner(),
        highlighter = highlighters,
        highlights = highlights,
        left = {
            ' ',
            wilder.popupmenu_devicons(),
            wilder.popupmenu_buffer_flags({
                flags = ' a + ',
                icons = { ['+'] = '', a = '', h = '' },
            }),
        },
        right = {
            ' ',
            wilder.popupmenu_scrollbar(),
        },
    })
)

local wildmenu_renderer = wilder.wildmenu_renderer({
    highlighter = highlighters,
    highlights = highlights,
    separator = ' · ',
    left = { ' ', wilder.wildmenu_spinner(), ' ' },
    right = { ' ', wilder.wildmenu_index() },
})

wilder.set_option('renderer', wilder.renderer_mux({
    [':'] = popupmenu_renderer,
    ['/'] = wildmenu_renderer,
    substitute = wildmenu_renderer,
}))
