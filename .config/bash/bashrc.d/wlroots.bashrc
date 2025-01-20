# https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/0.18/docs/env_vars.md

# journalctl --follow --user:
# /usr/libexec/gdm-wayland-session[4122]: ... [ERROR] [wlr] [backend/drm/atomic.c:79] connector eDP-1: Atomic commit failed: Device or resource busy
# /usr/libexec/gdm-wayland-session[4122]: ... [ERROR] [sway/desktop/output.c:317] Page-flip failed on output eDP-1
# set to 1 to always allocate planes without modifiers, this can fix certain modeset failures because of bandwidth restrictions.
export WLR_DRM_NO_ATOMIC=1
