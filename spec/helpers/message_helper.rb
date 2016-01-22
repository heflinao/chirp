require 'spec_helper'

describe MessageHelper, type: :helper do
  describe ".format_message" do
    it "returns an array of messages" do
    expect(helper.format_message([[:username, ["message"]], [:password, ["message"]]])).to eq(["username message", "password message"])
    end
  end
end
