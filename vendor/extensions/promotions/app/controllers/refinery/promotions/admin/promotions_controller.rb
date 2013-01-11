module Refinery
  module Promotions
    module Admin
      class PromotionsController < ::Refinery::AdminController

        crudify :'refinery/promotions/promotion', :xhr_paging => true

      end
    end
  end
end
