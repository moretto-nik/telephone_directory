class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.first_name == "" && record.last_name == "" && record.telephone_number == ""
      record.errors[:base] << "No information insert"
    elsif record.first_name == "" && record.last_name == ""
      record.errors[:base] << "You must insert firs or last name"
    elsif record.telephone_number.match(/[+]\d+\s\d+\s\d{6,}/) == nil
      record.errors[:base] << "Not valid telephone number"
    end 
  end
end

class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :telephone_number
  
  include ActiveModel::Validations
  validates_with MyValidator
end
