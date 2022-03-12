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

    if type -sq apt-get
        echo '*** updating linux packages'
        # command sudo apt-get -y -qq update
        command sudo apt-get -y update
        echo 'upgrading linux packages'
        # command sudo apt-get -y -qq --with-new-pkgs upgrade
        command sudo apt-get -y --with-new-pkgs upgrade
    end

    if type -sq brew
        echo '*** updating brew packages'
        command brew update
        echo '*** upgrading brew packages'
        command brew upgrade
    end

  # TODO: add tldr --update
end
