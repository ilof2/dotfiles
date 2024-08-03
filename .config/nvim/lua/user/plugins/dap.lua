return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "mfussenegger/nvim-dap-python",
    --     "ravenxrz/DAPInstall.nvim"
    },
    config = function()
        local dap = require("dap")
        dap.set_log_level('TRACE')
        --local dap_install = require("dap-install")

        --dap_install.setup({
        --    installation_path = vim.fn.stdpath("data") .. "/dapinstall/"
        --})
        -- require('dap.ext.vscode').load_launchjs(nil, {})
        -- dap.adapters.python = {
        --   type = 'executable';
        --   command = 'python';
        --   args = { '-m', 'debugpy.adapter' };
        -- }
        --dap_install.config("python", {})

    end

}
