{
  config,
  pkgs,
  libs,
  ...
}: let
  fullname = "Hervy Qurrotul Ainur Rozi";
  email = "hervyqa@proton.me";
  gpgkey = "85161EB8";
in {
  programs = {
    git = {
      enable = true;
      lfs = {
        enable = true;
      };
      config = {
        commit = {
          gpgsign = "true";
        };
        core = {
          editor = "hx";
        };
        init = {
          defaultBranch = "main";
        };
        pull = {
          rebase = "true";
        };
        url = {
          "git@git.sr.ht:" = {
            insteadOf = [
              "https://git.sr.ht/"
            ];
          };
          "git@github.com:" = {
            insteadOf = [
              "https://github.com/"
            ];
          };
          "git@gitlab.com:" = {
            insteadOf = [
              "https://gitlab.com/"
            ];
          };
        };
        user = {
          email = "${email}";
          name = "${fullname}";
          signingKey = "${gpgkey}";
        };
        status = {
          short = true;
        };
      };
    };
  };
}
