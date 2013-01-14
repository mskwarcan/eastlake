module Refinery
  module Staffs
    class Staff < Refinery::Core::BaseModel
      self.table_name = 'refinery_staffs'

      attr_accessible :name, :title, :image_id, :bio, :position

      acts_as_indexed :fields => [:name, :title, :bio]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
