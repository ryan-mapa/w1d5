class PolyTreeNode

  attr_reader :parent, :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(new_parent)
    if new_parent.nil?
      @parent = new_parent
    elsif !@parent.nil?
      @parent.children.delete(self)
      @parent = new_parent
      new_parent.children << self unless new_parent.children.include?(self)
    else
      @parent = new_parent
      new_parent.children << self unless new_parent.children.include?(self)
    end
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    raise "node is not a child" unless self.children.include?(child)
    child.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    q = [self]
    until q.empty?
      first = q.shift
      return first if first.value == target_value
      q += first.children
    end
    nil
  end

end
