EmailApp::App.controller do

  get "/" do
    path = params[:path].to_s.empty? ? "products" : params[:path].to_s
    res_header = {:headers => {"X-API-ACCESS-TOKEN" => ACCESS_TOKEN}}
    @req_code, @req_body, @req_header = YouhaosudaApp::HTTP.get(API_HOST + path, res_header)
    render 'main/index'
  end

end