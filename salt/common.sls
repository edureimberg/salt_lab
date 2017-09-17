install_common_packages:
  pkg.installed:
    # - pkgs:
    #   - vim
    - name: {{ pillar['editor'] }}