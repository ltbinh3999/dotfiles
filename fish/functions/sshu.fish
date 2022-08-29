function sshu
    ssh -i ~/.ssh/saleshood-ops.pem ubuntu@$argv[1] $argv[2..-1]
end
