module Refinery
  module Promotions
    class PromotionsController < ::ApplicationController

      before_filter :find_all_promotions
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @promotion in the line below:
        present(@page)
      end

      def show
        @promotion = Promotion.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @promotion in the line below:
        present(@page)
      end

    protected

      def find_all_promotions
        @promotions = Promotion.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/promotions").first
      end

    end
  end
end
