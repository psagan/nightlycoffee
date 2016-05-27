# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tag, :type => :model do

  describe "::normalize_name" do
    it "make name downcase" do
      name = "PaTriCk"

      result = Tag.normalize_name(name)

      expect(result).to eq("patrick")
    end
  end

  describe "::find_or_create_by" do
    it "normalizes name" do
      params = {name: "PaTriCk"}
      allow(ApplicationRecord).to receive(:find_or_create_by)
      expect(Tag).to receive(:normalize_name).with(params[:name]).once

      Tag.find_or_create_by(params)
    end

    it "calls super of itself" do
      allow(ApplicationRecord).to receive(:find_or_create_by)
      Tag.find_or_create_by({})

      expect(ApplicationRecord).to have_received(:find_or_create_by).once
    end

    it "calls super with normalized name" do
      params = {name: "PaTriCk"}
      allow(ApplicationRecord).to receive(:find_or_create_by)

      Tag.find_or_create_by(params)

      expect(ApplicationRecord).to have_received(:find_or_create_by).with({name: "patrick"}).once
    end
  end

  describe "#valid?" do
    it "calls ::normalize_name" do
      tag = Tag.new(name: "PatricK")
      allow(Tag).to receive(:normalize_name)

      tag.valid?

      expect(Tag).to have_received(:normalize_name).with("PatricK").once
    end
  end

end
