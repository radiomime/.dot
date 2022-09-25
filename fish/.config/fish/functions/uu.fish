function uu
    # install fisher
    if not type -sq fisher
        echo '*** installing fisher'
        command curl -sL https://git.io/fisher | source # && fisher install jorgebucaran/fisher
    end

    # install fisher plugins
    if type -sq fisher
        echo '*** installing fisher plugins'
        fisher update
    end
    # to uninstall: fisher list | fisher remove

    # apt packages
    if type -sq apt-get
        echo '*** updating linux packages'
        # command sudo apt-get -y -qq update
        command sudo apt-get -y update
        echo 'upgrading linux packages'
        # command sudo apt-get -y -qq --with-new-pkgs upgrade
        command sudo apt-get -y --with-new-pkgs upgrade
    end

    # brew packages
    if type -sq brew
        echo '*** updating brew packages'
        command brew update
        echo '*** upgrading brew packages'
        command brew upgrade
    end

    # tldr db
    if type -sq tldr
        echo '*** updating tldr database'
        tldr --update
    end

    # rust
    if type -sq rustup
        echo '*** updating rust'
        rustup update stable
    end

    # cargo packages
    if type -sq cargo
        echo '*** updating cargo packages'
        cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ' | xargs cargo install
    end

    # snap
    if type -sq snap
        echo '*** updating snap packages'
        snap refresh --list
        sudo snap refresh
    end


end
