let
in {
  none = { aliases = ["vi" "vim"]; support = import ./support.nix; };
  full = { support = { all = true; }; };
  # Categories
  appdev = {
    support = {
      dart      = true;
      react     = true;
      svelte    = true;
    };
  };
  apple = {
    support = {
      objc        = true;
      swift       = true;
    };
  };
  beam = {
    support = {
      elixir  = true;
      erlang  = true;
      gleam   = true;
    };
  };
  configs = {
    support = {
      json    = true;
      nickel  = true;
      toml    = true;
      yaml    = true;
    };
  };
  crypto = {
    support = {
      solidity = true;
    };
  };
  devops = {
    support = {
      ansible   = true;
      docker    = true;
      gitlab    = true;
      helm      = true;
      nix       = true;
      systemd   = true;
      terraform = true;
      toml      = true;
      yaml      = true;
    };
  };
  dotnet = {
    support = {
    csharp = true;
    };
  };
  functional = {
    support = {
      elm       = true;
      haskell   = true;
    };
  };
  gamedev = {
    support = {
      c         = true;
      cpp       = true;
      godot     = true;
      lua       = true;
      rust      = true;
    };
  };
  general = {
    support = {
      diagnostics = true;
      spelling    = true;
    };
  };
  gpu = {
    support = {
      cuda  = true;
      glsl  = true;
      wgsl  = true;
    };
  };
  jvm = {
    support = {
      java    = true;
      kotlin  = true;
      scala   = true;
    };
  };
  lisp = {
    support = {
      clojure = true;
      scheme  = true;
    };
  };
  lowlevel = {
    support = {
      arduino   = true;
      assembly  = true;
      c         = true;
      cpp       = true;
      d         = true;
      fortran   = true;
      llvmIR    = true;
      odin      = true;
      rust      = true;
      toml      = true;
      zig       = true;
    };
  };
  notes = {
    support = {
      latex     = true;
      markdown  = true;
      spelling  = true;
      typst     = true;
    };
  };
  scripting = {
    support = {
      awk     = true;
      lua     = true;
      perl    = true;
      python  = true;
      ruby    = true;
    };
  };
  shells = {
    support = {
      bash        = true;
      fish        = true;
      nushell     = true;
      powershell  = true;
    };
  };
  universal = {
    support = {
      c       = true;
      cpp     = true;
      go      = true;
      haskell = true;
      java    = true;
      python  = true;
      rust    = true;
    };
  };
  vim = {
    support = {
      fennel  = true;
      lua     = true;
      vim     = true;
    };
  };
  webdev = {
    support = {
      angular     = true;
      astro       = true;
      css         = true;
      html        = true;
      javascript  = true;
      json        = true;
      nginx       = true;
      protobuf    = true;
      react       = true;
      sql         = true;
      svelte      = true;
      typescript  = true;
      vue         = true;
      wasm        = true;
    };
  };
}
