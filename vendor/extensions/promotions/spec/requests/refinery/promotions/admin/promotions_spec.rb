# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Promotions" do
    describe "Admin" do
      describe "promotions" do
        login_refinery_user

        describe "promotions list" do
          before do
            FactoryGirl.create(:promotion, :title => "UniqueTitleOne")
            FactoryGirl.create(:promotion, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.promotions_admin_promotions_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.promotions_admin_promotions_path

            click_link "Add New Promotion"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Promotions::Promotion.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Promotions::Promotion.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:promotion, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.promotions_admin_promotions_path

              click_link "Add New Promotion"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Promotions::Promotion.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:promotion, :title => "A title") }

          it "should succeed" do
            visit refinery.promotions_admin_promotions_path

            within ".actions" do
              click_link "Edit this promotion"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:promotion, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.promotions_admin_promotions_path

            click_link "Remove this promotion forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Promotions::Promotion.count.should == 0
          end
        end

      end
    end
  end
end
