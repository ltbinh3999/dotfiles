function gc
    git checkout -b (echo $argv[1] | tr ' ' '-')
end
