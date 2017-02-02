class Profile < ActiveRecord::Base
  belongs_to :user

  #check for null - first_name and last_name
  validate :check_null_names
  #only male or female
  validates :gender, inclusion: ["male", "female"]
  #males cannot have a name called source
  validate :check_male_name_for_sue


  def check_null_names
    if first_name.nil? && last_name.nil?
      #use base because not associated with an element
      errors.add(:base, "Error: First or last name is empty")
    end
  end

  def check_male_name_for_sue
    if first_name.eql?("Sue") && gender.eql?("male")
      errors.add(:base, "Error: Male cannot be named Sue.")
    end
  end

  def self.get_all_profiles(birth_year_min, birth_year_max)
    Profile.where("birth_year BETWEEN :birth_year_min AND :birth_year_max", birth_year_min: birth_year_min, birth_year_max: birth_year_max).order(birth_year: :asc)

  end
end
