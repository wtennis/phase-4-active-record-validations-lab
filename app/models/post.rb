class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    validate :clickbait?
    # validates :title, inclusion: { in: ["Won't Believe", "Secret", "Top [number]", "Guess"] }


    def clickbait?
        unless title && title.match(/(Won't Believe)|(Top \d)|(Secret)|(Guess)/)
         errors.add(:title, "not clickbait")
        end
    end 

end
