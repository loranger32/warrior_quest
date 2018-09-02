# Class for creating all sorts of spaces
class Space
  
  
  attr_reader :name, :description, :group

  @spaces = []

  class << self
    attr_accessor :spaces
  end

  def initialize(args = {})
    @name        = args[:name]
    @description = args[:description]
    @group       = args[:group]
  end
end

throne_room = Space.new(name: 'Salle du trône',
                        description: 'Une magnifique salle,\
 dans laquelle se trouve concentrée toute la richesse de la région. Ceux qui \
 ont un avis qui compte se trouvent dans cette pièce. Parlez sagement !',
                        group: 'Château')
weaponery = Space.new(name: 'Salle d\'armes',
                      description: 'Une véritable salle aux\
 trésors pour ceux qui goûtent le maniement des armes. Vous y trouverez tout ce\
 dont vous pouvez rêver pour pourfendre, transpercer, assommer ou trancher vos\
 adversaires !', group: 'Château')

Space.spaces << throne_room
Space.spaces << weaponery
