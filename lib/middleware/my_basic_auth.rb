class MyBasicAuth < Rack::Auth::Basic
  def call(env)
    request = Rack::Request.new(env)
    # match の正規表現でヒットするものはbasic認証しない
		if request.path.match(/\A\/coverage/)
			# basic認証実行
			super
    else
      # basic認証をパス
      @app.call(env)
    end
  end
end
