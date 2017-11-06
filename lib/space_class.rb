class Space
  attr_reader :name, :description, :group

  def initialize(args={})
    @name        = args[:name]
    @description = args[:description]
    @group       = args[:group]
  end
end
