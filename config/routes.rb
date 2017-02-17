Rails.application.routes.draw do
  root 'urls#home'

  get '/slow' => 'urls#slow'
  get '/down' => 'urls#down'
  get '/pass' => 'urls#pass'

  get '/0' => 'urls#cacheable'
  get '/1' => 'urls#cacheable'
  get '/2' => 'urls#cacheable'
  get '/3' => 'urls#cacheable'
  get '/4' => 'urls#cacheable'
  get '/5' => 'urls#cacheable'
end
