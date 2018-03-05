class App < Sinatra::Base
  TITLE = "WDBXX"

  set :public_folder, -> { File.join(root, "..", "public") }
  set :views, -> { File.join(root, "views") }

  register Sinatra::ActiveRecordExtension

  if !RackEnv.prod?
    get '/q' do
      @result = nil
      @rows = 10
      haml :'q/index'
    end

    post '/q' do
      @rows = [params[:query].count("\n") + 1, 10].max
      begin
        @result = ActiveRecord::Base.connection.select_all(params[:query])
      rescue ActiveRecord::StatementInvalid => e
        @error = e
      end

      haml :'q/index'
    end
  end

end
