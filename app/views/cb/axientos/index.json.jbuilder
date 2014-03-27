json.array!(@cb_axientos) do |cb_axiento|
  json.extract! cb_axiento, :id, :nombre, :proyecto_id
  json.url cb_axiento_url(cb_axiento, format: :json)
end
