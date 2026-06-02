{
  flake.modules.nixos.base =
    { options, ... }:
    {
      programs.bash.promptInit = options.programs.bash.promptInit.default + ''
        PS1="''${PS1#\\n}"
      '';
    };
}
