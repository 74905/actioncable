class Room < ApplicationRecord
has_many :chats, dependent: :destroy
end
