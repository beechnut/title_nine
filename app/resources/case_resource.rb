class CaseResource < JSONAPI::Resource

  attributes :institution, :state, :status, :opened_at, :updated_at, :closed_at

  filters :state, :status, :institution

end
