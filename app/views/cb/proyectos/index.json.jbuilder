json.array!(@cb_proyectos) do |cb_proyecto|
  json.extract! cb_proyecto, :id, :name
  json.url cb_proyecto_url(cb_proyecto, format: :json)
end
