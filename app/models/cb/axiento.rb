# == Schema Information
#
# Table name: cb_axientos
#
#  agentenegocio_id     :integer
#  axiento_reemplazo_id :integer
#  axientoanula_id      :integer
#  concepto             :string(50)
#  correlativo          :string(10)
#  created_at           :datetime
#  creator_id           :integer
#  estado               :integer          default(1), not null
#  fecha                :datetime
#  fecha_contable_id    :integer          not null
#  fechac               :date
#  id                   :integer          not null, primary key
#  libro_id             :integer          not null
#  updated_at           :datetime
#  updater_id           :integer
#  user                 :string(10)
#  voucher              :string(15)       not null
#

#  estado: 1 -> editable (activo); 2 -> bloqueado; 3 -> anulado; 4 -> anulacion; 5 -> invalido


class Cb::Axiento < ActiveRecord::Base

  #as_enum :estadoo,[:eliminado,:editable, :bloqueado,:anulado, :anulacion, :invalido], :column => :estado

  #standard-attributes
  #TODO eliminiar strong_parameters
  #attr_accessible :empresa, :estado, :fecha_contable_id, :libro_id, :voucher, :moneda_id, :moneda, :libro, :correlativo
  #attr_accessible :axiento_dets_attributes, :fecha_contable, :fechac, :empresa_id, :concepto, :empresa_name

  #virtual attributes
  #attr_accessor :hidden_libro_id, :ingresado_en_vista, :debe, :haber, :debe_dolares, :haber_dolares #, :tipo_crear_doc_id
  #attr_accessible :hidden_libro_id, :ingresado_en_vista, :debe, :haber, :debe_dolares, :haber_dolares  #, :tipo_crear_doc_id

  has_many :axiento_dets,  :autosave => true, :class_name => "Cb::AxientoDet"
  accepts_nested_attributes_for :axiento_dets, :allow_destroy => true


  #def axiento_igualado_validation
  #  validates_with AxientoIgualadoValidator
  #end
  #
  ##before_create :generar_correlativo_y_voucher
  #
  #def initialize_children
  #  axiento_dets.each { |ad| ad.axiento = self }
  #end
  #
  #def anulado?
  #  !axientoanula.nil?
  #end
  #
  #def eliminado?
  #  self.estado==0
  #end
  #
  #def reemplazado?
  #  !axiento_reemplazo.nil?
  #end
  #
  #def axiento_dets_ordered
  #  #axiento_dets.sort_by!{|ad| [ad.tip_importe, ad.transicion]} #.sort_by!{|ad| ad.tip_importe}
  #  result= Array.new
  #  result += detalles_debe.sort_by{|ad| [ad.cuenta.cuenta, ad.transicion]}.reverse
  #  result += detalles_haber
  #  result
  #end
  #
  #def debe_soles
  #  monto_debe = 0
  #  axiento_dets.each do |axiento_det|
  #    monto_debe += axiento_det.equiv if axiento_det.debe? && !axiento_det.marked_for_destruction?
  #  end
  #  return monto_debe
  #end
  #
  #def haber_soles
  #  monto_haber = 0
  #  axiento_dets.each do |axiento_det|
  #    monto_haber += axiento_det.equiv if axiento_det.haber? && !axiento_det.marked_for_destruction?
  #  end
  #  return monto_haber
  #end
  #
  #def debe
  #  monto_debe = 0
  #  axiento_dets.each do |axiento_det|
  #    monto_debe += axiento_det.importe if axiento_det.debe? && !axiento_det.marked_for_destruction?
  #  end
  #  return monto_debe
  #end
  #
  #def haber
  #  monto_haber = 0
  #  axiento_dets.each do |axiento_det|
  #    monto_haber += axiento_det.importe if axiento_det.haber? && !axiento_det.marked_for_destruction?
  #  end
  #  return monto_haber
  #end
  #
  #def diff_debe_haber_dolares
  #  (debe_dolares - haber_dolares).abs
  #end
  #
  #def diff_debe_haber_soles
  #  return (debe_soles - haber_soles).abs
  #end
  #
  #def detalles_amr
  #  axiento_dets.select{|det| det.amr?}
  #end
  #
  #def detalles_org
  #  axiento_dets.select{|det| det.org?}
  #end
  #
  #def detalles_enl
  #  axiento_dets.select{|det| det.enl?}
  #end
  #
  #def detalles_pago
  #  axiento_dets.select{|det| det.pgs?}
  #end
  #
  #def detalles_diferencia_caja
  #  axiento_dets.select{|det| det.dfe?}
  #end
  #
  #def tipo_importe_que_falta
  #  Rails.logger.info "debe: #{debe}, haber: #{haber}"
  #  if haber < debe
  #    return 'H'
  #  elsif debe < haber
  #    return 'D'
  #  end
  #end
  #
  #def get_detalle_by_cuenta cuenta
  #  axiento_dets.select{|ax_det| ax_det.cuenta == cuenta}.first
  #end
  #
  #def get_detalle_pago_sin_documento
  #  axiento_dets.select{|ax_det| ax_det.documento.nil?}.first
  #end
  #
  #def importe_que_falta
  #  (haber - debe).abs
  #end
  #
  #def cuentas_asociadas
  #  cuentas = Array.new
  #  axiento_dets.each do |axiento_det|
  #    cuentas << axiento_det.cuenta_num
  #  end
  #  return cuentas
  #end
  #
  #def voucher_en_libro
  #  "#{voucher} en #{libro.denominacion}"
  #end
  #
  #def has_dolares?
  #  axiento_dets_dolares = axiento_dets.select{|det| det.moneda.dolares?}
  #  !axiento_dets_dolares.blank?
  #end
  #
  #def debe_dolares
  #  monto_debe = 0
  #  axiento_dets.each do |axiento_det|
  #    monto_debe += axiento_det.importe if (axiento_det.debe? && axiento_det.moneda.dolares?)
  #  end
  #  return monto_debe
  #end
  #
  #def haber_dolares
  #  monto_haber = 0
  #  axiento_dets.each do |axiento_det|
  #    monto_haber += axiento_det.importe if (axiento_det.haber? && axiento_det.moneda.dolares?)
  #  end
  #  return monto_haber
  #end
  #
  ##temporal para la migracion datos busqueda documentos
  #def primer_detalle_con_documento
  #  axiento_dets.find{|det| !det.documento.nil?}
  #end
  #
  #def generar_correlativo_y_voucher
  #  if correlativo.nil?
  #    self.correlativo = generar_correlativo
  #    self.voucher = generar_voucher
  #  end
  #end
  #
  #def generar_correlativo
  #  correlativo_max = Cb::Axiento.where(:libro_id => libro, :fecha_contable_id => fecha_contable).maximum(:correlativo)
  #  (correlativo_max.to_i + 1).to_s.rjust(5,"0")
  #end
  #
  #def generar_voucher
  #  fecha_contable.sin_gion + '-' + libro.codigo + '-' + correlativo.to_s
  #end
  #
  #def ingresado_en_vista?
  #  ingresado_en_vista == "1"
  #end
  #
  ##def add_documentos_a_dets
  ##  #initialize children, que pueden usar su axiento
  ##  initialize_children
  ##  axiento_dets.each do |det|
  ##    det.add_documento
  ##  end
  ##end
  #
  #def has_detalles_con_attributes attributes
  #  axiento_dets.each do |det|
  #    if det.attributes.includes_hash? attributes
  #      return true
  #    end
  #  end
  #  return false
  #end
  #
  #def cambiado_mes?
  #  !fecha_contable.fecha_in_fecha_contable? fechac
  #end
  #
  #def cambiado_libro?
  #  hidden_libro_id.to_i != libro_id
  #end
  #
  #def set_fecha_contable_del_fechac
  #  self.fecha_contable = Cb::FechaContable.fecha_contable_para_fecha fechac unless fechac.nil?
  #end
  #
  #def primer_documento
  #  axiento_dets.first.documento
  #end
  #
  #def detalles_debe
  #  axiento_dets.select {|det| det.debe?}
  #end
  #
  #def detalles_haber
  #  axiento_dets.select {|det| det.haber?}
  #end
end

