class ResourceName

  RESOURCES = {
    person:      { singular: "person",      pluralized: "persons"     },
    deal:        { singular: "deal",        pluralized: "deals"       },
    note:        { singular: "note",        pluralized: "notes"       },
    activity:    { singular: "activity",    pluralized: "activities"  },
    personField: { singular: "personField", pluralized: "personFields"}
  }

  attr_reader :singular, :pluralized

  def initialize(resource)
    resource = resource.to_sym
    @singular   = RESOURCES[resource][:singular]
    @pluralized = RESOURCES[resource][:pluralized]
  end
end
