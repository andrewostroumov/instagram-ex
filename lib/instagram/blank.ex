defprotocol Blank do
  @doc "Return true if object is considered as blank/empty"
  def blank?(object)
end

# Integer 0 is blank
defimpl Blank, for: Integer do
  def blank?(0), do: true
  def blank?(_), do: false
end

# Just empty list is blank
defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_),  do: false
end

# Map with size zero is blank
defimpl Blank, for: Map do
  def blank?(map), do: map_size(map) == 0
end

# Just the atoms false and nil are blank
defimpl Blank, for: Atom do
  def blank?(false), do: true
  def blank?(nil),   do: true
  def blank?(_),     do: false
end

# All other data types not blank by default
defimpl Blank, for: Any do
  def blank?(_), do: false
end
