class LogLineParser
    attr_reader :log_level, :message

  def initialize(line)
    define_instances(line)
  end

  def reformat
    "#{@message} (#{@log_level})"
  end

  private

  def define_instances(line)
    bracket_position = line.index(']')
    
    @message = line.split(":")[1].strip
    @log_level = line[1..bracket_position -1].downcase
  end
end
