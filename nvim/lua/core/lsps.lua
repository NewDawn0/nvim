local configs = { }
local support =  {
  angular     = {"angularls"},
  ansible     = {"ansiblels"},
  arduino     = {"arduino_language_server"},
  assembly    = {"asm_lsp"},
  astro       = {"astro", "biome"},
  awk         = {"awk_ls"},
  bash        = {"bashls"},
  c           = {"clangd", "mesonlsp", "sourcekit", "starpls", "cmake", "neocmake", "jinja_lsp"},
  clojure     = {"clojure_lsp"},
  cpp         = {"clangd", "mesonlsp", "sourcekit", "starpls", "cmake", "neocmake", "jinja_lsp"},
  csharp      = {"csharp_ls", "roslyn_ls"},
  css         = {"biome", "cssls", "tailwindcss"},
  cuda        = {"clangd"},
  d           = {"serve_d"},
  dart        = {"dartls"},
  diagnostics = {"diagnosticls"},
  docker      = {"docker_language_server", "docker_compose_language_service"},
  elixir      = {"elixirls", "lexical"},
  elm         = {"elmls"},
  erlang      = {"elp", "erlangls"},
  fennel      = {"fennel_ls"},
  fish        = {"fish_lsp"},
  fortran     = {"fortls"},
  gitlab      = {"gitlab_ci_ls"},
  gleam       = {"gleam"},
  glsl        = {"glsl_analyzer", "glslls"},
  go          = {"golangci_lint_ls", "gopls"},
  godot       = {"gdscript"},
  haskell     = {"ghcide", "hls"},
  helm        = {"helm_ls"},
  html        = {"biome", "emmet_language_server", "html", "htmx", "templ"},
  java        = {"jdtls"},
  javascript  = {"biome", "denols", "eslint", "oxlint"},
  json        = {"biome", "jsonls"},
  kotlin      = {"kotlin_language_server"},
  latex       = {"digestif", "texlab"},
  llvmIR      = {"cir_lsp_server"},
  lua         = {"lua_ls", "luau_lsp", "stylua"},
  make        = {"autotools_ls"},
  markdown    = {"markdown_oxide", "marksman"},
  nginx       = {"nginx_language_server"},
  nickel      = {"nickel_ls"},
  nix         = {"nixd", "nil", "statix"},
  nushell     = {"nushell"},
  objc        = {"clangd", "sourcekit"},
  odin        = {"ols"},
  perl        = {"perlls", "perlnavigator", "perlpls"},
  powershell  = {"powershell_es"},
  protobuf    = {"buf_ls", "protols"},
  python      = {"basedpyright", "pylsp"},
  react       = {"biome", "denols"},
  ruby        = {"ruby_lsp"},
  rust        = {"rust_analyzer"},
  scala       = {"metals"},
  scheme      = {"scheme_langserver"},
  solidity    = {"solc"},
  spelling    = {"codebook", "ltex_plus", "typos_lsp"},
  sql         = {"postgres_lsp", "sqls"},
  svelte      = {"biome", "svelte"},
  swift       = {"sourcekit"},
  systemd     = {"systemd_ls"},
  terraform   = {"terraform_lsp", "terraformls"},
  toml        = {"taplo"},
  typescript  = {"biome", "denols", "eslint", "oxlint"},
  typst       = {"tinymist"},
  vim         = {"vimls"},
  vue         = {"biome", "vue_ls"},
  wasm        = {"wasm_language_tools"},
  wgsl        = {"wgsl_analyzer"},
  yaml        = {"yamlls"},
  zig         = {"zls"},
}

local function allEnabled()
  return vim.g.support.all ~= nil and vim.g.support.all
end
local function enabled(lang)
  return vim.g.support[lang] ~= nil and vim.g.support[lang]
end

-- Configure Lsps
for lsp, cfg in pairs(configs) do
  vim.lsp.config[lsp] = cfg
end

-- Enable Lsps
if allEnabled() then
  vim.lsp.enable(vim.tbl_flatten(vim.tbl_values(support)))
else
  for lang, lsp in pairs(support) do
    if enabled(lang) then
      vim.lsp.enable(lsp)
    end
  end
end
