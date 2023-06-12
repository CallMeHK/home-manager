local lspconfig = require("lspconfig")
require("mason").setup()
local all_lsp = { "lua_ls", "tsserver", "elixirls", "rust_analyzer", "html", "graphql", "cssls", "rnix" }
local lsps = { "lua_ls", "tsserver" } -- rnix installed through home-manager

require("mason-lspconfig").setup({
  ensure_installed = lsps,
})

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end 

vim.diagnostic.config({ virtual_text = false })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if has_value(lsps, "tsserver") then
lspconfig.tsserver.setup({
	-- uncomment this if using deno
	-- root_dir = nvim_lsp.util.root_pattern("package.json"),
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
	end,
})
end


lspconfig.rnix.setup{}

if has_value(lsps, "eslint") then
	lspconfig.eslint.setup({})
end

if has_value(lsps, "yamlls") then
lspconfig.yamlls.setup({})
end

if has_value(lsps, "cssls") then
lspconfig.cssls.setup({
	capabilities = capabilities,
})
end

if has_value(lsps, "html") then
lspconfig.html.setup({
	capabilities = capabilities,
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
	},
})
end

if has_value(lsps, "graphql") then
lspconfig.graphql.setup({})
end

-- Config information: https://sharksforarms.dev/posts/neovim-rust/
if has_value(lsps, "graphql") then
lspconfig.rust_analyzer.setup({
	-- on_attach=on_attach,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
})
end

if has_value(lsps, "elixirls") then
lspconfig.elixirls.setup({
	on_attach = function(client, bufnr)
		-- client.server_capabilities.documentFormattingProvider = false
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
	end,
	settings = {
		elixirLS = {
			-- I choose to disable dialyzer for personal reasons, but
			-- I would suggest you also disable it unless you are well
			-- aquainted with dialzyer and know how to use it.
			dialyzerEnabled = false,
			-- I also choose to turn off the auto dep fetching feature.
			-- It often get's into a weird state that requires deleting
			-- the .elixir_ls directory and restarting your editor.
			fetchDeps = false,
		},
	},
})
end

if has_value(lsps, "lua_ls") then
lspconfig.lua_ls.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
	end,
})
end
