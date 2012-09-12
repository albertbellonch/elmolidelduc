class StaticController < ApplicationController
  def info
    Info.new_info(params[:name],
                       params[:email],
                       params[:phone],
                       params[:message]).deliver
    redirect_to root_path
  end
end
