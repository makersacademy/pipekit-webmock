require 'spec_helper'

describe ResourceName do

  context "#singular" do
    it "person returns a resource of 'person'" do
      resource_label = ResourceName.new("person")

      expect(resource_label.singular).to eq("person")
    end

    it "deal returns a resource of 'deal'" do
      resource_label = ResourceName.new("deal")

      expect(resource_label.singular).to eq("deal")
    end

    it "note returns a resource of 'note'" do
      resource_label = ResourceName.new("note")

      expect(resource_label.singular).to eq("note")
    end

    it "personField returns a resource of 'personField'" do
      resource_label = ResourceName.new("personField")

      expect(resource_label.singular).to eq("personField")
    end

    it "activity returns a resource of 'activity'" do
      resource_label = ResourceName.new("activity")

      expect(resource_label.singular).to eq("activity")
    end
  end

  context "#pluralized" do
    it "person returns a resource of 'persons'" do
      resource_label = ResourceName.new("person")

      expect(resource_label.pluralized).to eq("persons")
    end

    it "deal returns a resource of 'deals'" do
      resource_label = ResourceName.new("deal")

      expect(resource_label.pluralized).to eq("deals")
    end

    it "note returns a resource of 'notes'" do
      resource_label = ResourceName.new("note")

      expect(resource_label.pluralized).to eq("notes")
    end

    it "personField returns a resource of 'personFields'" do
      resource_label = ResourceName.new("personField")

      expect(resource_label.pluralized).to eq("personFields")
    end

    it "activity returns a resource of 'activities'" do
      resource_label = ResourceName.new("activity")

      expect(resource_label.pluralized).to eq("activities")
    end
  end
end
