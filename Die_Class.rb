class Die
  attr_reader :faces

  def initialize(faces = 6)
    @faces = faces
  end

  def roll
    rand(1..faces)
  end
end
