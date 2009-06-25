module MoreHtml
  def lip(*args, &block)
    li { p(*args, &block) }
  end

  def pem(*args, &block)
    p { em(*args, &block) }
  end
end
