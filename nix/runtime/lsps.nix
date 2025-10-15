{ lib
, pkgs
, support
}: let
  enabled = elem: support.all || support.${elem};
in (with lib; concatLists (mapAttrsToList (k: v: optionals (enabled k) v) (with pkgs; {
  ansible = [ansible-language-server];
  arduino = [arduino-language-server];
  lua = [lua-language-server];
})))
# ++ mkLang "any"         [codebook]
# ++ mkLang "arduino"     [arduino-language-server]
# ++ mkLang "assembly"    [asm-lsp]
# ++ mkLang "astro"       [astro-language-server]
# ++ mkLang "c3"          [c3-ls]
# ++ mkLang "javascript"  [biome deno]
# ++ mkLang "lua"         [lua-language-server]
# ++ mkLang "nix"         [nix nixd nil]
# ++ mkLang "protobuf"    [buf]
# ++ mkLang "python"      [basedpyright]
# ++ mkLang "rust"        [bacon]
# ++ mkLang "shell"       [bash-language-server]
# ++ mkLang "c"           [ccls clang-tools]
# ++ mkLang "clojure"     [clojure-lsp]
# ++ mkLang "cmake"       [cmake-language-server]
# ++ mkLang "crystal"     [crystalline]
# ++ mkLang "csharp"      [csharp-ls]
# ++ mkLang "css"         [vscode-langservers-extracted]
# ++ mkLang "dart"        [dart]
# ++ mkLang "tex"         [luaPackages.digestif]
# ++ mkLang "docker"      [docker-language-server docker-compose-language-service]
# ++ mkLang "elixir"      [beamPackages.elixir-ls]
# ++ mkLang "elm"         [elmPackages.elm-language-server]
# ++ mkLang "erlang"      [erlang-language-platform beamPackages.erlang-ls]
# ++ mkLang "emmet-ls"    [emmet-ls]
