class ActiveRecord::Base
  private
  # TODO: Handle page-scoped position for section.
  def set_initial_position
    if self.class.count == 0
      self.position = 0
    elsif self.position == nil
      self.position = self.class.last.position + 1
    end
  end
end
