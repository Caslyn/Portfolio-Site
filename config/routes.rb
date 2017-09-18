Rails.application.routes.draw do
  root 'urls#home'

  get '/pass' => 'urls#pass'
  get '/download' => 'urls#download'
  get '/slow' => 'urls#slow'

end
