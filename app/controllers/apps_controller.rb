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
    Dir.glob("base_templates/**/*")
       .select{|t| !t.include?(".erb")}
       .each do |folder|
        %x|mkdir -p projects/#{@app.name}/#{folder.sub!("base_templates/", "")}|
    end
    Dir
      .glob("base_templates/**/*")
      .select{|t| t.include?(".erb")}
      .each do |template_name|

        template = ERB.new(File.open(template_name).read)
        puts template_name
        File.write("projects/#{@app.name}/#{template_name.sub!(".erb", "").sub!("base_templates/", "")}", template.result(binding))


    end

    %x| cd projects/#{@app.name}; npm i; npx prisma migrate dev --name init|


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
