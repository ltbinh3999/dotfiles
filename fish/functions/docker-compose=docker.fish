function docker-compose=docker --wraps=compose --description 'alias docker-compose=docker compose'
  compose $argv; 
end
