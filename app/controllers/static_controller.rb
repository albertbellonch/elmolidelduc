class StaticController < ApplicationController
  def index
    @info = {:name => "moli", :paragraphs => 4}
    @pics = %w{ portada_1 }
  end

  def farinera
    @info = {:name => "farinera", :paragraphs => 4}
    @pics = %w{ farinera_1 farinera_2 farinera_3 farinera_4 farinera_5 }
  end

  def events
    @info = {:name => "galeria", :paragraphs => 4}
    @pics = %w{ graner_1 graner_2 graner_3 graner_4 graner_5 graner_6 sala_1 sala_2 jardi_1 jardi_2 jardi_3 jardi_4 jardi_5 cuina_1 cuina_2 cuina_3 cuina_4  }
  end

  def info
    Info.new_info(params[:name],
                       params[:email],
                       params[:phone],
                       params[:message]).deliver
    redirect_to root_path
  end
end
