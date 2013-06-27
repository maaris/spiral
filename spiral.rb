require "ostruct"

class Spiral

  def initialize(two_dim_array)
    @two_dim_array = two_dim_array
    @results = []
    @initial_position = OpenStruct.new(x: 0, y: 0)
    @current_position = @initial_position.dup
    @field_length = @two_dim_array.size - 1
  end

  def order!
    traverse_field
    @results
  end

  private

  def traverse_field
    go_right
    go_down
    go_left
    go_up
    set_new_starting_point

    if has_move_to_right?
      @field_length -= 1
      traverse_field
    end
  end

  def has_move_to_right?
    (@field_length - @current_position.x) > 0
  end

  def go_right
    (@current_position.x..@field_length).each do |step|
      @results << @two_dim_array[@current_position.y][step]
    end
    @current_position.x = @field_length
  end

  def go_down
    ((@current_position.y + 1)..@field_length).each do |step|
      @results << @two_dim_array[step][@current_position.x]
    end
      @current_position.y = @field_length
  end

  def go_left
    ((@current_position.x - 1).downto(@initial_position.x)).each do |step|
      @results << @two_dim_array[@current_position.y][step]
    end
    @current_position.x = @initial_position.x
  end

  def go_up
    ((@current_position.y - 1).downto(@initial_position.x + 1)).each do |step|
      @results << @two_dim_array[step][@current_position.x]
    end
    @current_position.y = @initial_position.x + 1
  end

  def set_new_starting_point
    @initial_position.x = @current_position.x + 1
    @current_position.x += 1
  end
end
