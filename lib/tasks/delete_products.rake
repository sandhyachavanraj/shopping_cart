namespace :delete_products do
  desc "deleting product values based on category_id"
  task :update_table => :environment do
    Product.destory_all("category_id is null")
  end
end





