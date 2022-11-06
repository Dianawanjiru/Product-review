class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

   def leave_review(user, star_rating, comment)
    Review.create(star_rating:star_rating, comment:comment, product_id:self.id, user_id:user.id)
   end
    
end