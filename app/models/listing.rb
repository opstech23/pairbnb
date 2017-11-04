class Listing < ApplicationRecord
  belongs_to :user

  scope :by_user, lambda { |user|
    where(:user_id => user.id) unless user.admin?
  }

  # To find listings using the by_user method for the current user,
  # you may use the below method

  # Listing.by_user(current_user).find(params[:id])

end
