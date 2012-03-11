class ReportController < ApplicationController
  before_filter :authenticate_admin_user!
  
  def index
    @time = Time.now
    @beginning_of_month = Date.today.at_beginning_of_month
    @beginning_of_week = Date.today.at_beginning_of_week

    @shops = Shop.all

    @shop_info = []
    @shop_day_info = []

    @shops.each do |shop|
      @current_month_sum = 0
      @current_week_sum = 0
      @users = shop.users.all
      #name
      #month
      #week
      
      @orders_current_month = Order.where('created_at >= ? AND user_id IN (?)', @beginning_of_month, @users)
      @orders_current_month.each do |order|
        @current_month_sum += order.total_price
      end

      @orders_current_week = Order.where('created_at < ? and created_at > ? and user_id IN (?)', Time.now, @beginning_of_week, @users)
      @orders_current_week.each do |order|
        @current_week_sum += order.total_price
      end

      @orders_count_per_day = Order.count(:all, :conditions => ["created_at >= ? AND user_id IN (?)", @beginning_of_month, @users], :group => "DATE(created_at)")
      #@orders_1_week_ago = Order.where('created_at < ? and created_at > ? and id = ?', Time.now, 1.week.ago, shop.id).count
      #@orders_per_day = Order.where('created_at >= ? AND user_id IN (?)', @beginning_of_month, @users).group("date(created_at)").sort
      #@orders_per_day = Order.where('created_at >= ? AND user_id IN (?)', @beginning_of_month, @users).group_by(&:created_at).sort

      @orders_per_day = Order.where('created_at >= ? AND user_id IN (?)', @beginning_of_month, @users).group_by(&:group_by_criteria).sort
      
      @orders_per_day.each do |day, orders|
        #puts "#{day} -> #{tran.map(&:id).join(', ')}"
        total = 0
        orders.each do |order|
          total += order.total_price
        end

        shop_day_info = {
          :day => day.to_s,
          :total_price => total.to_s,
          :per_day_count => orders.count
        }

        puts "\n \n"
        puts shop_day_info[:day]
        puts shop_day_info[:total_price]
        puts "\n \n"

        @shop_day_info << shop_day_info 

      end

      shop_detail = {
            :name => shop.name,
            :users => @users,
            :current_month_count => @orders_current_month.count,
            :current_month_sum => @current_month_sum,
            :current_week_count => @orders_current_week.count,
            :current_week_sum => @current_week_sum,
            :shop_day_info => @shop_day_info
      }


      @shop_info << shop_detail

    end


    
  end

  def shop
    @time = Time.now
    @beginning_of_month = Date.today.at_beginning_of_month
    @beginning_of_week = Date.today.at_beginning_of_week

    @shop = Shop.find_by_id(params[:id])

    @shop_info = []
    @shop_day_info = []

      @current_month_sum = 0
      @current_week_sum = 0
      @users = @shop.users.all
      #name
      #month
      #week
      
      @orders_current_month = Order.where('created_at >= ? AND user_id IN (?)', @beginning_of_month, @users)
      @orders_current_month.each do |order|
        @current_month_sum += order.total_price
      end

      @orders_current_week = Order.where('created_at < ? and created_at > ? and user_id IN (?)', Time.now, @beginning_of_week, @users)
      @orders_current_week.each do |order|
        @current_week_sum += order.total_price
      end

      @orders_count_per_day = Order.count(:all, :conditions => ["created_at >= ? AND user_id IN (?)", @beginning_of_month, @users], :group => "DATE(created_at)")
      #@orders_1_week_ago = Order.where('created_at < ? and created_at > ? and id = ?', Time.now, 1.week.ago, shop.id).count
      #@orders_per_day = Order.where('created_at >= ? AND user_id IN (?)', @beginning_of_month, @users).group("date(created_at)").sort
      #@orders_per_day = Order.where('created_at >= ? AND user_id IN (?)', @beginning_of_month, @users).group_by(&:created_at).sort

      @orders_per_day = Order.where('created_at >= ? AND user_id IN (?)', @beginning_of_month, @users).group_by(&:group_by_criteria).sort
      
      @orders_per_day.each do |day, orders|
        #puts "#{day} -> #{tran.map(&:id).join(', ')}"
        total = 0
        orders.each do |order|
          total += order.total_price
        end

        shop_day_info = {
          :day => day.to_s,
          :total_price => total.to_s,
          :per_day_count => orders.count
        }

        puts "\n \n"
        puts shop_day_info[:day]
        puts shop_day_info[:total_price]
        puts "\n \n"

        @shop_day_info << shop_day_info 

      end

      shop_detail = {
            :name => @shop.name,
            :users => @users,
            :current_month_count => @orders_current_month.count,
            :current_month_sum => @current_month_sum,
            :current_week_count => @orders_current_week.count,
            :current_week_sum => @current_week_sum,
            :shop_day_info => @shop_day_info
      }


      @shop_info << shop_detail

    end

end
