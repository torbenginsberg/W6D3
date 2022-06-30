# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_id   :integer
#  likeable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  liker_id      :integer
#
class Like < ApplicationRecord
    validates :likeable_id, :likeable_type, :liker_id, presence: true

    belongs_to :likeable, :polymorphic => true
end
