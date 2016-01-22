module MessageHelper
  def format_message(msg)
    msg.map{ |m| m.flatten.join(" ") }
  end
end
