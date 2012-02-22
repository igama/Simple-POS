

<h2>Top Products</h2>

<div class="product-grid">
	<% @products.each do |top| %>	
	<div>
		<div class="name"><%= link_to top.product.name, product  %></div>
		<div class="image"><%= link_to(image_tag(top.product.image.url, :class => 'list_image'), product, :class => "thumbnail") %></div>
		<div class="price"><%= number_to_currency(top.product.price) %><br></div>
		<div class="cart"><%= button_to 'Add to Cart', cart_items_path(:product_id => top.product), :remote => true, :class => "btn btn-small" %></div>
	</div>
	<% end %>
</div>
