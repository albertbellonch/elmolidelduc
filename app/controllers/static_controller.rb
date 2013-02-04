class StaticController < ApplicationController
  def index
    @info = {:name => "moli", :paragraphs => 4}
    @images = Image.where(:kind => 'portada')
  end

  def farinera
    @info = {:name => "farinera", :paragraphs => 4}
    @images = Image.where(:kind => 'farinera')
  end

  def events
    @info = {:name => "galeria", :paragraphs => 4}
    @images = Image.where(:kind => 'events')
  end

  def info
    Info.new_info(params[:name],
                       params[:email],
                       params[:phone],
                       params[:message]).deliver
    redirect_to root_path
  end
end
