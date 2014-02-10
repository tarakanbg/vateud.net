#encoding: utf-8
class Member < ActiveRecord::Base
  attr_accessible :cid, :firstname, :lastname, :email, :rating, :pilot_rating, :humanized_atc_rating, :humanized_pilot_rating,
    :region, :country, :state, :division, :subdivision, :age_band, :experience, :reg_date, :susp_ends, :active

  has_paper_trail

  LOCAL_CSV = "#{Dir.tmpdir}/vatsim_csv.csv"

  def self.humanized_rating(rating)
    case rating
      when "0" then "Inactive"
      when "1" then "OBS"
      when "2" then "S1"
      when "3" then "S2"
      when "4" then "S3"
      when "5" then "C1"
      when "7" then "C3"
      when "8" then "INS"
      when "10" then "INS+"
      when "11" then "Supervisor"
      when "12" then "Administrator"
      else
        "UNK"
    end
  end

  def self.humanized_pilot_rating(pilot_rating)
    case pilot_rating
      when "0" then "P0"
      when "1" then "P1"
      when "3" then "P1, P2"
      when "4" then "P3"
      when "5" then "P1, P3"
      when "7" then "P1, P2, P3"
      when "9" then "P1, P4"
      when "11" then "P1, P2, P4"
      when "15" then "P1, P2, P3, P4"
      when "27" then "P1, P2, P4, P5"
      when "31" then "P1, P2, P3, P4, P5"
      when "59" then "P1, P2, P4, P5, P6"
      when "63" then "P1, P2, P3, P4, P5, P6"
      else
        "UNK"
      end
  end



end
