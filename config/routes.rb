Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/dashboard", { :controller => "application", :action => "dashboard" })
  get("/forex", { :controller => "application", :action => "forex" })
  get("/forex/:country", { :controller => "application", :action => "forex_results" })
  get("/forex/:country1/:country2", { :controller => "application", :action => "forex_results2" })
end
