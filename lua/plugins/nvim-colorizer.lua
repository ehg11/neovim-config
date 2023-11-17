return {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
        require('colorizer').setup({
            'css';
            'js';
            'ts';
            'jsx';
            'tsx';
            'html';
        })
    end,
}
