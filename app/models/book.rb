class Book < ApplicationRecord
    
    validates :title, presense: true
    validates :body, presense: true

end
