require 'csv'

csv_file = File.read('bigfile.csv')

csv = CSV.parse(csv_file)
n = 0
csv.each do |row|
  n +=1
  next if n == 1 or row.join.blank?
  
  @brand = Brand.find_by_name(row[1].strip)
  if @brand == nil
    @brand = Brand.new(:name => row[1].strip)
    @brand.save
  end

  product = Product.find_by_reference(row[0].strip)
  #product = Product.find(["name = ? AND reference = ?", row[1].strip, row[0].strip])
  
  if product == nil
    product2 = Product.find_by_name(row[2].strip)
    if product2 != nil
      next
    end
    product = Product.new()
    product.name = row[2].strip
    puts product.name
    product.reference = row[0].strip
    if File.exist?(row[5].strip)
      puts row[5]
      product.image = File.open(row[5].strip,'rb')
    end
  end
  
  product.brand_id = @brand.id
  product.wholesale = row[3]
  product.price = row[4]
  product.save!
  
end 