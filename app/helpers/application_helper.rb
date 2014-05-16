module ApplicationHelper

  def render_compartments(compartments)
    compartments.each do |compartment|
      unless compartment.has_children?
        compartment.title
      else
        render_compartments(compartment.children)
      end
    end
    a
  end

end
