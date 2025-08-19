vim.diagnostic.config({
    severity_sort = true,
    underline = { severity = vim.diagnostic.severity.ERROR },
    virtual_text = {
        spacing = 2,
        source = true,
        format = function(diagnostic)
            local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            print(diagnostic)
            return diagnostic_message[diagnostic.severity]
        end,
    },
})
vim.filetype.add({
    -- extension = {
    -- 	tf = function()
    -- 		return "terraform",
    -- 			function()
    -- 				vim.opt_local.tabstop = 2
    -- 				vim.opt_local.shiftwidth = 2
    -- 				vim.opt_local.softtabstop = 2
    -- 			end
    -- 	end,
    -- 	tfvars = function()
    -- 		return "terraform-vars",
    -- 			function()
    -- 				vim.opt_local.tabstop = 2
    -- 				vim.opt_local.shiftwidth = 2
    -- 				vim.opt_local.softtabstop = 2
    -- 			end
    -- 	end,
    -- 	yaml = function()
    -- 		local ft = "yaml"
    -- 		local dirname = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
    -- 		if
    -- 			vim.fs.find("Chart.yaml", {
    -- 				upward = true,
    -- 				stop = vim.loop.os_homedir(),
    -- 				path = dirname,
    -- 			}) and vim.regex(".*/templates.*"):match_str(dirname)
    -- 		then
    -- 			ft = "helm"
    -- 		end
    -- 		return ft,
    -- 			function()
    -- 				vim.opt_local.tabstop = 2
    -- 				vim.opt_local.shiftwidth = 2
    -- 				vim.opt_local.softtabstop = 2
    -- 			end
    -- 	end,
    -- },
    filename = {
        ["Jenkinsfile"] = "groovy",
        ["*.cs"] = "c#",
        -- [os.getenv("HOME") .. "/.kube/config"] = "yaml",
    },
})

