class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end

  def self.iterate_nodes(node, listing = nil)
    listing ||= ""
    return listing[0..-5] if node.nil?
    listing << "#{node.value} -> "
    iterate_nodes(node.next, listing)
  end

  def self.reverse_nodes(node)
    # nothing to reverse
    return node if node.next.nil?

    # set 2nd node in 1st position
    head = node.next
    # pull 1st out
    tail = node
    # remove next link from the original 1st node
    node.next = nil
    # set the next in line to 2nd
    on_deck = head.next

    while on_deck.next != nil
      # link the first to the last
      head.next = tail
      # move the first in front of the last
      tail = head
      # move the 2nd to 1st
      head = on_deck
      # move the next in line to 2nd
      on_deck = on_deck.next
    end

    # link 1st to the previous 1st
    head.next = tail
    # link the new first to the 2nd
    on_deck.next = head
    puts "#{Node.iterate_nodes(on_deck)}"
    # return new 1st node
    on_deck
  end
end
