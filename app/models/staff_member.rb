class StaffMember < ActiveRecord::Base
  attr_accessible :callsign, :cid, :email, :position, :priority, :vacc_code, :vateud_confirmed

  attr_accessor :name
  attr_accessor :member

  default_scope order('priority ASC')

  belongs_to :subdivision, :primary_key => 'code', :foreign_key => 'vacc_code'

  has_paper_trail

  validates :callsign, :position, :vacc_code, :priority, :presence => true

  def name
    if self.member
        self.member.firstname + " " + self.member.lastname
    else
      "VACANT"
    end
  end

  def member
    Member.find_by_cid(self.cid)
  end




end
