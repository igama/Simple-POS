require 'csv'

csv_file = File.read('bigfile.csv')

csv = CSV.parse(csv_file)
n = 0
csv.each do |row|
  n +=1
  next if n == 1 or row.join.blank?
  
  @brand = Brand.find_by_name(row[4].strip)
  if @brand == nil
    @brand = Brand.new(:name => row[4].strip)
    @brand.save
  end
  
  puts row[1]

  product = Product.find_by_reference(row[0].strip)
  #product = Product.find(["name = ? AND reference = ?", row[1].strip, row[0].strip])
  
  if product == nil
    product = Product.new()
    product.name = row[1].strip
    product.reference = row[0].strip
  end
  
  product.brand_id = @brand.id
  product.wholesale = row[2]
  product.price = row[5]
  #product.image.new(:image => File.open(row[3],'rb') )
  if File.exist?(row[3].strip)
    puts row[3]
    product.image = File.open(row[3].strip,'rb')
  end
  product.save!
  
end  