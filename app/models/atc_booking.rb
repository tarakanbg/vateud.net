class AtcBooking < ActiveRecord::Base
  attr_accessible :admin_user_id, :controller, :ends, :eu_id, :position, :starts

  belongs_to :admin_user

  validates :controller, :admin_user_id, :starts, :ends, :position, :presence => true
  validates_length_of :position, :maximum => 11
  validates_length_of :controller, :maximum => 50

  has_paper_trail

  after_create :create_vatbook_booking, on: :create
  before_destroy :delete_vatbook_booking
  after_update :update_vatbook_booking



end
