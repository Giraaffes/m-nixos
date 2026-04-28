{ pkgsUnstable }:
pkgsUnstable.rclone.overrideAttrs (finalAttrs: prevAttrs: {
  version = "master";

  src = pkgsUnstable.fetchFromGitHub {
    owner = "rclone";
    repo = "rclone";
    rev = "b715ad2a9751edc9ae977cbb232dae944e1ce9a5"; 
    hash = "sha256-lxMQbRM1bfXdOJjtbd8OfNksah4VvU4exvj8VkyARDM="; 
  } // { tag = "master"; };

  vendorHash = "sha256-6aZotGyYuDG1BIlmUDyiacDh1qDA5kpwBAEHAHRXQOA="; 

  doInstallCheck = false;
})