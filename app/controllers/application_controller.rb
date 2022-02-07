class ApplicationController < ActionController::Base
  def dashboard
    render("/dashboard.html.erb")
  end

  def forex
    # Parameters: {"user_street_address"=>"Merchandise Mart, Chicago"}

    @forex_url = "https://api.exchangerate.host/symbols"

    @raw_json_string = open(@forex_url).read

    @parsed_json = JSON.parse(@raw_json_string)

    @results_array = @parsed_json.fetch("symbols").keys

    render("forex_templates/forex.html.erb")
  end

  def forex_results
    @curr_result = params.fetch("country")

    @forex_url = "https://api.exchangerate.host/symbols"

    @raw_json_string = open(@forex_url).read

    @parsed_json = JSON.parse(@raw_json_string)

    @results_array = @parsed_json.fetch("symbols").keys
  
    render({:template => "forex_templates/forex_results.html.erb"})
  end

  def forex_results2
    @curr_result_1 = params.fetch("country1")
    @curr_result_2 = params.fetch("country2")

    @forex_url = "https://api.exchangerate.host/convert?from=" + @curr_result_1 + "&to=" + @curr_result_2

    @raw_json_string = open(@forex_url).read

    @parsed_json = JSON.parse(@raw_json_string)

    @results = @parsed_json.fetch("result")
  
    render({:template => "forex_templates/forex_results2.html.erb"})
  end

end
