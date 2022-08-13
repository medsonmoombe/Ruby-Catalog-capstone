require './app'

def main
  @app = App.new
  @app.run
  @app.load_data
end

main
