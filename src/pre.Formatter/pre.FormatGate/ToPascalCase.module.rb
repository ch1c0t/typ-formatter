refine Symbol do
  def to_pascal_case
    to_s.split('_').map(&:capitalize).join
  end
end
