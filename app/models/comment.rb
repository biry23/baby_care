class Comment < ApplicationRecord
  before_action :authenticate_member!
  belongs_to :member
  belongs_to :pos
end
