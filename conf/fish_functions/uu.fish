function uu
    # install fisher
    if not type -sq fisher
        echo 'installing fisher'
        command curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    end
    # to uninstall: fisher list | fisher remove

    # apt-get update/upgrade
    if type -sq apt-get
        echo 'updating linux packages'
        command sudo apt-get update -y -qq && sudo apt-get upgrade -y -qq
    end

    # brew update/upgrade
    if type -sq brew
        echo 'updating linux packages'
        command brew update && brew upgrade
    end
end
