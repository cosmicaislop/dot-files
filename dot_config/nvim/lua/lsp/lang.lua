local on_attach = require("lsp.base").on_attach

-- set on_attach globally for all servers
vim.lsp.config("*", {
	on_attach = on_attach,
})

-- lua
vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = { "lua/?.lua", "lua/?/init.lua" },
			},
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
		})
	end,
})
vim.lsp.enable("lua_ls")

-- go
vim.lsp.config("gopls", {
	cmd = { "gopls", "--remote=auto" },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = { unusedparams = true },
			gofumpt = true,
		},
	},
})
vim.lsp.enable("gopls")

-- terraform
vim.lsp.config("terraformls", {})
vim.lsp.enable("terraformls")

-- ruff
vim.lsp.config("ruff", {})
vim.lsp.enable("ruff")
