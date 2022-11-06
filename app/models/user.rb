class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    #returns the product instance that has the highest star rating from this user

    def favorite_product
        self.products.order('star_rating ASC').last
    end

    #takes a `Product` (an instance of the `Product` class) and removes _all_ of this 
    #user's reviews for that product
   #you will have to delete any rows from the `reviews` table associated with this user and the product

    def remove_reviews(product)
        self.reviews.where(product:product).destroy_all
    end
    
end