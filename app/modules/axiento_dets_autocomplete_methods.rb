module AxientoDetsAutocompleteMethods 

  def proyecto=(name)
    name_parts = name.split(":")
    unless name_parts[0].blank?
      proyecto= Cb::Proyecto.find_by(codigo: name_parts[0].strip)
      unless proyecto.nil?
        self.proyecto_id = proyecto.id
      else
        self.proyecto_id = nil
      end 
    else
      self.proyecto_id = nil      
    end
  end

  def proyecto
    Cb::Proyecto.find(proyecto_id).codigo_nombre_con_dos_puntos if proyecto_id
  end   
end
