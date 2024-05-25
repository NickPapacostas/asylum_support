class MetricsController < ApplicationController

  # searches in the description of the cases for keywords to order them in categories
  def map_description(description)
    health = ["hospital", "health", "medical", "psychologist", "pregnant"]
    legal = ["legal", "interview appointment", "interview prep", "family reunification", "first decision", "second decision"]
    if legal.any? {|k| description.include? k} and health.any? {|k| description.include? k}
      return "Legal & Health"
    elsif legal.any? {|k| description.include? k}
      return "Legal"
    elsif health.any? {|k| description.include? k}
      return "Health"
    else
      return "None"
    end
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

    # works the same as @nationalities
    @topics = Case.all.group_by{|c| map_description(c.description)}
                  .map{ |topic, list| [topic, list.group_by_month{|x| x.created_at}]}
                  .map{ |topic, list| [topic, list.map{|date, m| [date, m.count]}.to_h]}
                  .to_h

  end
end