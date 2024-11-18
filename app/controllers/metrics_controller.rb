class MetricsController < ApplicationController

  # searches in the description of the cases for keywords to order them in categories
  def map_description(description)

    tags_to_map = [["Health",["hospital", "health", "medical", "psychologist", "pregnant"]],
                   ["Legal",["legal", "interview appointment", "interview prep", "family reunification", "first decision", "second decision"]],
                   ["Clothes",["clothes", "freeshop", "free shop"]],
                   ["Food", ["food"]]]
    mapped_tags = []

    tags_to_map.each do |tags|
      if tags[1].any? {|k| description.downcase.include? k}
        mapped_tags.push(tags[0])
      end
    end
    mapped_tags


  end

  def map_tags(cases)
    #create map, for every tag empty list to collect cases
    tags = Case.tag_options.map{|tag| [tag, []]}.to_h
    cases.each do |c|
      # if the case has no tags, try to read it out of the description
      c_tags = c.tags.empty? ? map_description(c.description) : c.tags
      c_tags.each do |tag|
        unless tag == ""
          tags[tag].push(c)
        end
      end
    end

    tags

  end



  def show


    # @members = Member.all.map{|m| [m.nationality,m.created_at.to_s.split(" ")[0]]}

    # grouped by nationality
    # If the nationality is "", replace it with "No Country"
    # for all members with the nationality, group them by month
    # for every month, count the entries
    # returns a hash with nationality : hash (date, count of entries)
    @nationalities = Member.all.group_by{|m| m.nationality}
                           .map{ |nationality, list| [nationality == "" ? "No Country" : nationality, list.group_by_month{|x| x.created_at}]}
                           .map{ |nationality, list| [nationality, list.map{|date, m| [date, m.count]}.to_h]}
                           .to_h

    # groups cases after their tags, functions similar to @nationalities, but uses the map_tags functions to group the cases
    # If cases have multiple tags, they will be counted for every tag
    @tags = map_tags(Case.all)
                .map{ | tags, list| [tags, list.group_by_month{|x| x.created_at}]}
                .map{ | tags, list| [tags, list.map{|date, m| [date, m.count]}.to_h]}
                .to_h
  end
end