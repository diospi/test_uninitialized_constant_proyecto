module ApplicationHelper

  def link_to_add_fields(name, f, association, partial_name = association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(partial_name.to_s.singularize + "_fields", :f => builder)
    end
    # link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
    link_to name, '', :onclick => "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :remote => true, class: :agregar_detalle_link
  end
end
