class ListManager
  def check_empty_list(list, list_name)
    return unless list.empty?

    puts "There's no #{list_name} stored yet"
  end
end