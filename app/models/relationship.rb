class Relationship < ApplicationRecord
  #follower_id : フォローしたユーザー
  #followed_id : フォローされたユーザー
  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"


end
