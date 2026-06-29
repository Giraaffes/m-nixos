{ pkgs, pkgsUnstable, ... }:
{
  home.packages = [
    pkgsUnstable.devenv
    pkgsUnstable.openjdk21
  ];

  home.sessionVariables = {
    # This tells the JVM to bypass the buggy Linux container/cgroup check entirely
    _JAVA_OPTIONS = "-XX:-UseContainerSupport";
  };

  home.stateVersion = "25.11";
}
