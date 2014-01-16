class Feedback < ActiveRecord::Base
 belongs_to :user,
   inverse_of: :feedbacks
 belongs_to :post,
   inverse_of: :feedbacks
 validates_presence_of :comment

 mount_uploader :image, ImageUploader
end
