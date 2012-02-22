class SearchController < ApplicationController
  def index
    @brands = Brand.all
    query = params[:search]
    
    if !query.to_s.strip.empty?
      tokens = query.split.collect {|c| "%#{c.downcase}%"}
      
      @string = ""
      
      last = tokens.last
      tokens.each do |token|
        @string += "name LIKE "+'"'+"#{token}"+'"'
        if token != last
          @string += " AND "
        else
          @string += ""
        end
      end
      
      @products = Product.search(@string)
    end
    
  end

end
