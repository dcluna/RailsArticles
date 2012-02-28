require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe PostsHelper do
  describe "translated_statuses" do
    it "returns a list of statuses in the current locale" do
      helper.translated_statuses.to_s.should match /([a-zA-Z]( |$))*/
    end
  end
end
