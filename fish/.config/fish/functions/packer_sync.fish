function packer_sync
    nvim --headless -c 'autocmd User PackerComplete quitall' -c PackerSync
end
