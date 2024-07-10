class AppsController < ApplicationController
  def index
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
    tsx = File.open("app/templates/card.tsx.erb").read
    template = ERB.new(tsx)
    puts template.result(binding)
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(application_params)
    if @app.save
      redirect_to @app
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def application_params
    params.require(:app).permit(:name)
  end
end
