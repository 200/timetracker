module GeneralHelpers

  def to_ar_model(string)
    string.gsub(" ", "_").singularize.camelize.constantize
  end

  def to_factory_name(string)
    string.strip!
    string = string.split(" ").collect(&:singularize).join("_")
    string.to_sym
  end

  def map_association_columns!(table, factory)
    model = Factory.factory_by_name(factory).build_class
    table.dup.hashes.first.keys.grep(/associated/).each do |column|
      match = /associated (.*) by (.*)/.match column
      association_model = model.reflections[match[1].to_sym].class_name.constantize
      query_method = "find_by_#{match[2]}".to_sym
      table.map_column!(column) { |query_param| 
        association_model.send(query_method, query_param)}
      association = match[1].to_sym
      table.map_headers!(column => association)
    end 
  end 


end

World(GeneralHelpers)
