function sshkeypop
  if type -sq sed
    echo '*** removing last line from known_hosts file'
    switch (uname)
      case Linux
        sed -i '$d' ~/.ssh/known_hosts
      case Darwin
        sed -i '' -e '$ d' ~/.ssh/known_hosts
      case '*'
        sed -i '$d' ~/.ssh/known_hosts
    end
    cat ~/.ssh/known_hosts
  end
end
