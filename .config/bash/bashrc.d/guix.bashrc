# Guix, package manager

# https://wiki.archlinux.org/title/Guix
# ~/.config/guix/current paths end up first in path list
for profile in "$HOME/.guix-profile" "$HOME/.config/guix/current"
do
  if [ -f "$profile/etc/profile" ]
  then
    # Load the user profile's settings.
    GUIX_PROFILE="$profile" ; \
    source "$profile/etc/profile"
  else
    # At least define this one so that basic things just work
    # when the user installs their first package.
    export PATH="$profile/bin${PATH:+:$PATH}"
    export INFOPATH="$profile/share/info${INFOPATH:+:$INFOPATH}"
  fi
done

unset profile

export GUIX_LOCPATH="${HOME}/.guix-profile/lib/locale"

GUIX_PROFILE="${HOME}/.config/guix/current"
source "$GUIX_PROFILE/etc/bash_completion.d/guix"
source "$GUIX_PROFILE/etc/bash_completion.d/guix-daemon"

# https://www.gnu.org/software/guix/manual/en/guix.html#Defining-Packages
export GUIX_PACKAGE_PATH="${XDG_CONFIG_HOME}/guix/packages"

# https://www.gnu.org/software/guix/manual/en/guix.html#X_002e509-Certificates
# export SSL_CERT_DIR="$HOME/.guix-profile/etc/ssl/certs"
# export SSL_CERT_FILE="$HOME/.guix-profile/etc/ssl/certs/ca-certificates.crt"
export SSL_CERT_DIR="/etc/ssl/certs"
export SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"
export GIT_SSL_CAINFO="$SSL_CERT_FILE"

if [ -n "$GUIX_ENVIRONMENT" ]
then
    export PS1="\u@\h \w [dev]\$ "
# else
#    source ~/.bash_profile
fi
