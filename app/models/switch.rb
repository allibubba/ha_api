class Switch < Equipment
  def available_events
    {power: boolean_values, dimmer: range_values}
  end
end
