{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    clojure
    clojure-lsp
    leiningen
    # TODO: Do we need graalvm here? Even if we do not need it, we might want to
    # use it instead of the regular jvm due to the speed improvments
  ];
}
