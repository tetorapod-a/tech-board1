class Plan < ApplicationRecord
  validates :name, presence: true
end

# 読んだら消す
# とりあえずplanモデルができた。