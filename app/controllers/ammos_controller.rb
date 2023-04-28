class AmmosController < ApplicationController
  before_action :check_if_owner, :only => [:show, :edit]

  require 'net/http'
  require 'uri'
  require 'json'

  def index
    @ammos = Ammo.where(:user_id => @current_user.id)
  end

  def new
    @ammo = Ammo.new
  end

  def create
    ammo = Ammo.create ammo_params
    ammo.update(:user_id => @current_user.id)

    # Auto associate firearms that share the same calibre string 
    @current_user.firearms.where(calibre: ammo.calibre).each do |firearm|
      ammo.firearms << firearm
    end
    
    redirect_to ammo
  end

  def edit
    @ammo = Ammo.find params[:id]
  end

  def update
    ammo = Ammo.find params[:id]
    ammo.update ammo_params

    # Auto associate firearms that share the same calibre string 
    ammo.firearms.destroy_all
    @current_user.firearms.where(calibre: ammo.calibre).each do |firearm|
      ammo.firearms << firearm
    end

    redirect_to ammo
  end

  def show
    @ammo = Ammo.find params[:id]

    uri = URI.parse("https://api.tarkov.dev/graphql")

    header = { "Content-Type": "application/json" }
    query = { "query": "{ ammo { item { name } ricochetChance } }" }
    
    # Create the HTTP object
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = query.to_json

    # Send the request
    response = http.request(request)

    # Convert to JSON and loop through data
    response_data = JSON.parse(response.body)
    response_data["data"]["ammo"].each do |ammo|
      # Check if the item name matches
      if ammo["item"]["name"] == "#{ @ammo.calibre } #{ @ammo.name }"
        # Print the ricochetChance associated with this item
        puts "The ricochetChance of #{ @ammo.name } is #{ ammo["ricochetChance"] }"
      end
    end

    # Display request results
    # puts response.code
    # puts response.message
    puts response.body

  end

  def destroy
    ammo = Ammo.find params[:id]
    ammo.destroy
    redirect_to ammos_path
  end

  private

  def ammo_params
    params.require(:ammo).permit(:name, :calibre, :manufacturer_id, :bullet_velocity, :fragmentation_chance, :ricochet_chance, :quantity, :image)
  end

  def check_if_owner
    ammo = Ammo.find_by :id => params[:id]
    redirect_to root_path unless @current_user.id == ammo.user_id
  end
end
