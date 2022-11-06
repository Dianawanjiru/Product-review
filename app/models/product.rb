class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

   def leave_review(user, star_rating, comment)
    Review.create(star_rating:star_rating, comment:comment, product_id:self.id, user_id:user.id)
   end
   #should `puts` to the terminal a string representing each review for this product
   #each review should be formatted as follows: `Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}`
   def print_all_reviews
    self.reviews.each do |review|
        review.print_review
    end
   end

    
    #returns a `float` representing the average star rating for all reviews 
    #for this product
    def average_rating
        self.reviews.average('star_rating').to_f
    end

    
end