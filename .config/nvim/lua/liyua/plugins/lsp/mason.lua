return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "ansiblels",
        "asm_lsp",
        "bashls",
        "ast_grep",
        "clangd",
        "neocmake",
        "cssls",
        "tailwindcss",
        "docker_compose_language_service",
        "dockerls",
        "glslls",
        "gopls",
        "gradle_ls",
        "html",
        "hyprls",
        "jdtls",
        "tsserver",
        "jqls",
        "biome",
        "kotlin_language_server",
        "texlab",
        "lua_ls",
        "marksman",
        "opencl_ls",
        "glsl_analyzer",
        "pyright",
        "sqlls",
        "harper_ls",
        "taplo",
        "lemminx",
        "yamlls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "asmfmt",
        "beautysh",
        "clang-format",
        "cmakelang",
        "prettier",
        "crlfmt",
        "google-java-format",
        "ktfmt",
        "bibtex-tidy",
        "latexindent",
        "stylua",
        "cbfmt",
        "autopep8",
        "black",
        "isort",
        "sqlfmt",
        "xmlformatter",

        "ansible-lint",
        "shellcheck",
        "cpplint",
        "cmakelint",
        "eslint_d",
        "hadolint",
        "revive",
        "detekt",
        "vale",
        "luacheck",
        "pylint",
        "sqlfluff",
        "yamllint"
      },
    })
  end,
}
