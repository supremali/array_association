# frozen_string_literal: true

module ArrayAssociation
  module Utils
    def self.normalize_integer_array(value)
      values = Array(value).select(&:present?).map(&:to_i)
      values.uniq.sort
    end
  end
end
