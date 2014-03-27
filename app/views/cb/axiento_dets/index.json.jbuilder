json.array!(@cb_axiento_dets) do |cb_axiento_det|
  json.extract! cb_axiento_det, :id, :name, :proyecto_id
  json.url cb_axiento_det_url(cb_axiento_det, format: :json)
end
