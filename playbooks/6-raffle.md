
# This will copy the ssh keys and then use them to clone some of my private repos to `~/.toolbox`
---
- hosts: cpg_raffle
  # connection: local # If this is set to local it ignores the port for some reason
  tasks:
    - name: Clone AstroVim
      git:
        repo: "https://github.com/AstroNvim/AstroNvim"
        dest: "/home/{{ ansible_user }}/.config/nvim"
        clone: yes
        update: yes

  # After this, run `nvim +PackerSync`
  # and follow the instructions in the repo README

    - name: Create `~/workrepos`
      file:
        path: "/home/{{ ansible_user }}/workrepos"
        state: directory
        mode: 0755

    - name: Clone repos
      git:
        repo: "git@github.com:raffle-ai/{{ item }}.git"
        dest: "/home/{{ ansible_user }}/workrepos/{{ item }}"
        clone: yes
        update: yes
      loop:
        - am-api
        - amcm
        - analytics-api
        - api-backend
        - autopilot-frontend
        - content-api
        - copilot-backend
        - copilot-frontend
        - event-api
        - go-scripts
        - local-dev
        - onboarding-api
        - plz
        - search-analytics
        - search-backend
        - search-frontend
        - source-api
        - utils-ng
        - wiki
    #
    # - name: Remove previous dotfiles
    #   file:
    #     path: "/home/{{ ansible_user }}/{{ item }}"
    #     state: absent
    #   loop:
    #     - ".zshrc"
    #     - ".config/i3"
    #   tags:
    #     - dotfiles
    #
    # - name: Run `stow`
    #   shell: "stow --target=/home/{{ ansible_user }} *"
    #   args:
    #     chdir: "/home/{{ ansible_user }}/.toolbox/dotfiles"
    #   tags:
    #     - dotfiles
    #
    #   # Remove previous dotfiles
    #   # Run stow
    #
    #   
