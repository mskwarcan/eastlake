module Refinery
  module Promotions
    class Promotion < Refinery::Core::BaseModel
      self.table_name = 'refinery_promotions'

      attr_accessible :title, :promotion_id, :active, :position

      acts_as_indexed :fields => [:title]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :promotion, :class_name => '::Refinery::Image'
    end
  end
end
