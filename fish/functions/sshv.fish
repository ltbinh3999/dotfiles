function sshv
    ssh -i ~/.ssh/id_rsa vagrant@$argv[1] $argv[2..-1]
end
