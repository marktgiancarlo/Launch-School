def maximize
  # returns a board configuration and its utility
  if board.terminal_state #end of round
    return nil, calculate_utility(board)
  end

  max_utility = 0
  move_with_max_utility = nil

  board.children.each do |possible_move, board_child| #board.children has computer markers for max, other marker for min
    utility = minimize(board_child)
    if utility > max_utility
      move_with_max_utility = possible_move
      max_utility = utility
    end
  end

  return move_with_max_utility, max_utility
end

def minimize
  # returns a board configuration and its utility
  if board.end_of_round?
    return nil, calculate_utility(board)
  end

  min_utility = 1000
  move_with_min_utility = nil

  board.children.each do |possible_move, board_child|
    utility = maximize(board_child)
    if utility < min_utility
      move_with_min_utility = possible_move
      min_utility = utility
    end
  end

  return move_with_min_utility, min_utility
end


end