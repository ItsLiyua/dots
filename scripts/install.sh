# 1. Generate keyfiles for extra disks in case there are any
# 2. Install keyfile contents inside luks for access on device
# 3. Generate new random age key for secrets
# 4. Add age key to secrets
# 5. nixos-anywhere with installer image and additional disk keyfiles and newly added age key as extra files passed over
#
# Reboot not possible if keyfile not installed yet. Find a way to install that before the reboot.
#
# 6. Reboot
# 7. SSH into installer build (Gen 1)
# 8. Copy 
# 9. Generate another age key using the host SSH keyfile
# 10. Add the second age key and update secrets using previously added key
# 11. Install full system config now that secrets are accessible
# 12. Install home manager config

echo This is still a work-in-progress
