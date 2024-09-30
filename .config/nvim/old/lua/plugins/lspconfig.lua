return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    -- Enable snippet capability for completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Define servers to set up
    local servers = {
      ts_ls = { -- TypeScript language server configuration
        on_attach = function(client, bufnr)
          -- Optional: Disable default formatting to use a different formatter (e.g., Prettier)
          client.server_capabilities.document_formatting = false
        end,
        settings = {
          typescript = {
            inlayHints = {
              parameterNameHints = 'all',
              variableTypeHints = true,
              functionLikeReturnTypeHints = true,
              propertyDeclarationTypeHints = true,
            },
            organizeImports = {
              formatOptions = {
                style = "module",
                alphabetize = {
                  order = "asc",
                  caseInsensitive = false,
                },
                groupImports = {
                  camelCase = true,
                  order = "asc",
                  caseInsensitive = false,
                },
              },
            },
          },
        },
      },
      gopls = {},    -- Go language server
      html = {},     -- HTML language server
      tailwindcss = {}, -- Tailwind CSS language server
      bashls = {},   -- Bash language server
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- Use LuaJIT
            },
            diagnostics = {
              globals = { "vim" }, -- Recognize 'vim' as a global variable
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true), -- Load Neovim runtime files
            },
            telemetry = {
              enable = false, -- Disable telemetry
            },
          },
        },
      },
      jsonls = {},     -- JSON language server
      pylsp = {},      -- Python language server
      cssls = {},      -- CSS language server
      quick_lint_js = {}, -- JavaScript linting server
    }

    -- Set up each server
    for lsp, opts in pairs(servers) do
      lspconfig[lsp].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
      }, opts))
    end

    -- Key mappings for LSP features
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show Code Action" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.hover, { desc = "Show Hover Information" })
    vim.keymap.set("n", "<C-i>", vim.lsp.buf.hover, { desc = "Show Hover Information" })
    vim.keymap.set("n", "<leader>hsi", vim.lsp.buf.signature_help, { desc = "Signature Help" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
    vim.keymap.set("n", "<leader>sdi", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
  end,
}
