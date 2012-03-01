class CartItemsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cart_items }
    end
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
    @cart_item = CartItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart_item }
    end
  end

  # GET /cart_items/new
  # GET /cart_items/new.json
  def new
    @cart_item = CartItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart_item }
    end
  end

  # GET /cart_items/1/edit
  def edit
    @cart_item = CartItem.find(params[:id])
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    condition = params[:product_condition]
    #@cart_item = @cart.cart_items.build(:product => product)
    @cart_item = @cart.add_product(product.id, product.price, condition)

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to store_url, notice: 'Item added to cart.' }
        format.js { @current_item = @cart_item }
        format.json { render json: @cart_item, status: :created, location: @cart_item }
      else
        format.html { render action: "new" }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cart_items/1
  # PUT /cart_items/1.json
  def update
    @cart_item = CartItem.find(params[:id])

    respond_to do |format|
      if @cart_item.update_attributes(params[:cart_item])
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item = CartItem.find(params[:id])
    cart = @cart_item.cart
    @cart_item.destroy

    respond_to do |format|
      if current_cart.cart_items.empty?
        format.html { redirect_to store_url, notice: "Cart is empty." }
        format.json { head :ok }
      else
        format.html { redirect_to @cart_item.cart, notice: "Line was removed from cart." }
        format.json { head :ok }
      end
    end
  end
end
