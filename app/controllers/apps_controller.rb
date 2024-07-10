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
    %x|cd projects; npx create-next-app #{@app.name} -e with-supabase; cd #{@app.name}; npx shadcn-ui@latest init -y -d|

    files = %w[app/globals.css app/layout.tsx tailwind.config.ts app/page.tsx]

    files.each do |name|
      file = File.open("templates/#{name}.erb").read
      template = ERB.new(file)
      File.write("projects/#{@app.name}/#{name}", template.result(binding))
    end

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
