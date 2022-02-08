function uu
    # install fisher
    if not type -sq fisher
        echo 'installing fisher'
        command curl -sL https://git.io/fisher | source # && fisher install jorgebucaran/fisher
    end

    # install fisher plugins
    if type -sq fisher
      echo 'installing fisher plugins'
      fisher update
    end
    # to uninstall: fisher list | fisher remove

    # apt-get update/upgrade
    if type -sq apt-get
        echo 'updating linux packages'
        # command sudo apt-get -y -qq update
        command sudo apt-get -y update
        echo 'upgrading linux packages'
        # command sudo apt-get -y -qq --with-new-pkgs upgrade
        command sudo apt-get -y --with-new-pkgs upgrade
    end

    # brew update/upgrade
    if type -sq brew
        echo 'updating linux packages'
        command brew update && brew upgrade
    end
end
