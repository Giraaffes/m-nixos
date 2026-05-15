{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "unlock";
  runtimeInputs = with pkgs; [ gnupg keepassxc ];
  text = ''
    KEY_PATH="$HOME/vault-key.gpg"
    VAULT_PATH="$HOME/drive/Kodeord/Passwords.kdbx"
    for arg in "$@"; do
      case "$arg" in
        --key=*)
          KEY_PATH="''${arg#*=}"
          shift
          ;;
        --vault=*)
          VAULT_PATH="''${arg#*=}"
          shift
          ;;
      esac
    done

    while true; do
      ERR_FILE=$(mktemp)
      VAULT_PASS=$(gpg -d "$KEY_PATH" 2>"$ERR_FILE")
      GPG_EXIT_CODE=$?
      GPG_ERR=$(<"$ERR_FILE")
      rm -f "$ERR_FILE"

      cat "$ERR_FILE"

      if [ $GPG_EXIT_CODE -eq 0 ]; then
          break
      elif [[ "$GPG_ERR" == *"cancelled by user"* ]]; then
          echo "Canceled by user."
          exit 1
      elif [[ "$GPG_ERR" == *"decryption failed: Bad session key"* ]]; then
          echo "Sorry, please try again."
      else
          echo "An unexpected error occurred:"
          echo "$GPG_ERR"
          exit 1
      fi
  done

  echo "$VAULT_PASS" | keepassxc --pw-stdin --minimized "$VAULT_PATH" 1>/dev/null 2>&1 &
  echo "Vault successfully unlocked."

  unset VAULT_PASS
'';
}
