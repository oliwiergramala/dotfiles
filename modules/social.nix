{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		signal-desktop
			discord
			pipewire
			wireplumber             # PipeWire session manager
			xdg-desktop-portal
			xdg-desktop-portal-gtk  # For X11 / GTK apps
			xdg-desktop-portal-gnome # For GNOME/Wayland
			xdg-desktop-portal-wlr   # For Sway/Wayland
	];
}
