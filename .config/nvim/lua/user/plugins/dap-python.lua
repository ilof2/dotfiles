return {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    config = function ()
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
    end
}
