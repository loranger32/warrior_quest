# Module with repair capabilities - to be included in relevant characters class
module Repairable
  def repair_weapon(weapon)
    weapon.repair_by(30)
  end
end
