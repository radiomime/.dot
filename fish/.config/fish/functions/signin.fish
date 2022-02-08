function signin
  set -l name "Matt Wright"
  set -l personal wright.matthew91@gmail.com
  set -l work matt@onehot.io

  echo '*** Choose git account'
  echo '1.' $name '' personal '[default]'
  echo '2.' $name '' work

  read -l --prompt-str="Which account? " response
  echo $response

  switch $response
    case 2
      git config user.name $name
      git config user.email $work
    case '' 1
      git config user.name $name
      git config user.email $personal
  end

  echo '*** git settings:'
  git config user.name
  git config user.email
end
