module Logging
  def method_missing(method, *args)
    path = define_path_to_logging
    if path
      Dir.chdir(path) do
        File.open("bad_method_calls.txt", "a") do |f|
          f.puts bad_method_call(method, *args)
        end
      end
    end
    super
  end

  def define_path_to_logging
    path = File.expand_path('')
    if path.match(/warrior_quest/)
      path.sub!(/warrior_quest.*/, 'warrior_quest/logs')
      path
    else
      nil
    end
  end

  def bad_method_call(method, *args)
    arguments = args.empty? ? 'no arguments' : args.join(', ') 
    <<~ERROR_LOG
    On #{Time.now}, method :#{method} was called on #{self} with #{arguments}.

    ERROR_LOG
  end
end
