# == Schema Information
#
# Table name: cb_axiento_dets
#
#  axiento_id        :integer
#  centrocosto_id    :integer
#  created_at        :datetime
#  creator_id        :integer
#  cuenta_id         :integer
#  documento_id      :integer
#  estado            :integer          default(1)
#  estimporte        :integer          default(1)
#  flujoefectivo_id  :integer
#  id                :integer          not null, primary key
#  importe           :decimal(12, 2)   not null
#  moneda_id         :integer          not null
#  presupuesto_id    :integer
#  proyecto_id       :integer
#  tip_importe       :string(1)        not null
#  tip_oper_grava_id :integer
#  tipcambext        :float            default(1.0)
#  transicion        :string(3)
#  updated_at        :datetime
#  updater_id        :integer
#  user              :string(10)
#

class Cb::AxientoDet < ActiveRecord::Base
  #include Sis::UserCreatorUpdater
  include AxientoDetsAutocompleteMethods

  #standard-attributes
  #TODO eliminiar strong_parameters
  #attr_accessible :importe, :cuenta_id, :moneda_id, :tip_importe, :centrocosto_id, :presupuesto_id, :flujoefectivo_id, :tip_oper_grava_id, :transicion, :tipcambext
  #attr_accessible :moneda, :cuenta, :cuenta_name, :documento, :centrocosto, :presupuesto, :flujoefectivo, :proyecto, :fechac
  #attr_accessible :documento_id, :estado, :documento_name, :proyecto_id, :ref_axiento_det

  #virtuelle-attributes
  #attr_accessor :igv_check, :igv, :monto
  #attr_accessible :igv_check, :igv, :monto

  belongs_to :axiento #, :foreign_key => "id_axiento"
  #belongs_to :documento, :class_name => 'Hds::Documento' #, :foreign_key => "id_documento"
  #belongs_to :cuenta#, :class_name => "Cb::Cuenta" #TODO: delete after cb
  #belongs_to :moneda#, :class_name => "Cb::Moneda" #TODO: delete after cb
  belongs_to :proyecto
  #has_one :documento_det, :class_name => 'Hds::DocumentoDet', :foreign_key => :axiento_det_generado_id
  #belongs_to :ref_axiento_det, :class_name => 'Cb::AxientoDet'
  #has_many :ref_axiento_det_al_reves, :class_name => 'Cb::AxientoDet', :foreign_key => :ref_axiento_det_id

  # validates :id_axiento, :presence => true
  validates :importe, :presence => true
  #validates :cuenta_id, :presence => true
  #validates :moneda_id, :presence => true
  #validates :tipcambext, :presence => true, :numericality => { :greater_than => 0}

  #validates :cuenta_id, :cuenta_registro => true

  #after_initialize :initialize_values_default

  #validates :documento_id, :presence => :actualizar_documento_estado_contable
  #validate  :actualizar_documento_estado_contable

  #def sincronizar_documento
  #  #documento = Hds::Documento.where("documento_id = ?",self.documento_id)
  #  Hds::Documento.where("id = ?",self.documento_id).empty?
  #end
  #def actualizar_documento_estado_contable
  #  unless existe_documento?
  #    #estado_contable_documetno = Hds::Documento.where("id = ?",self.documento_id).first.estado_ctb_cd
  #    documento = Hds::Documento.find(documento_id)#where("id = ?",self.documento_id).first
  #    estado_contable_documento = documento.estado_ctb_cd
  #    estado_contable_documento += 1
  #                                                 #documento.attributes(:estado_ctb_cd => estado_contable_documento)
  #
  #                                                 #Hds::Documento.attributes(:estado_ctb_cd => 1)
  #    unless documento.update_attributes(:estado_ctb_cd => estado_contable_documento)
  #      Rails.logger.error "No se puede actualizar el estado contable del Documento"
  #    end
  #
  #  end
  #
  #end
  #
  #def existe_documento?
  #  self.documento_id.nil?
  #end
  #def documento_name=(name)
  #  name_parts = name.split(" :: ")
  #  unless name_parts[1].blank?
  #    documento= Hds::Documento.find(name_parts[1])
  #    self.documento_id = documento.id unless documento.nil?
  #    if documento.nil?
  #      @documento_para_anadir = name
  #    end
  #  else
  #    self.documento_id = nil
  #  end
  #end
  #
  ##def add_documento
  ##  serie_numero = @documento_para_anadir.split("-") unless @documento_para_anadir.nil?
  ##  Rails.logger.info "jetzt sind wir in add_documento (...) axiento-agente: #{axiento.empresa.nombre_comercial}"
  ##  unless serie_numero[0].blank?
  ##    documento = Hds::Documento.where("hds_documentos.numero like ?", serie_numero[1].strip).where("hds_documentos.serie like ?", serie_numero[0].strip)
  ##                         .where(:empresa_id => axiento.empresa_id).first
  ##    if documento.nil?
  ##      documento = Hds::Documento.create :empresa => axiento.empresa, :moneda => moneda, :tipo_documento_id => axiento.tipo_crear_doc_id, :fec_pago => axiento.fechac, :fec_emision => axiento.fechac, :serie => serie_numero[0], :numero => serie_numero[1]
  ##      Rails.logger.info "creado documento: #{documento.empresa.nombre_comercial} -> #{documento.serie_numero}"
  ##    end
  ##    self.documento = documento
  ##  end unless serie_numero.nil?
  ##end
  #
  #def documento_name
  #  Hds::Documento.find(documento_id).mostrar_documento_bonito if documento_id
  #end
  #
  ##TODO deberia estar en documento_dets
  #def subtotal
  #  monto.to_f - igv.to_f
  #end
  #
  #def equiv
  #  Rails.logger.info "importe: #{importe}, tipcambext: #{tipcambext} trans: #{transicion}"
  #  (importe.round(2) * tipcambext).round(2)
  #end
  #
  #def debe?
  #  tip_importe == 'D'
  #end
  #
  #def haber?
  #  tip_importe == 'H'
  #end
  #
  #def reverse_tip_importe
  #  if debe?
  #    'H'
  #  else
  #    'D'
  #  end
  #end
  #
  #def toggle_tip_importe!
  #  self.tip_importe = reverse_tip_importe
  #end
  #
  #def amr?
  #  transicion == 'AMR'
  #end
  #
  #def org?
  #  transicion == 'ORG'
  #end
  #
  #def pgs?
  #  transicion == 'PGS'
  #end
  #
  #def dfe?
  #  transicion == 'DFE'
  #end
  #
  #def enl?
  #  transicion == 'ENL'
  #end
  #
  #def cuentas_asociadas
  #  unless axiento.nil?
  #    cuentas = axiento.cuentas_asociadas
  #    cuentas.delete(cuenta_num)
  #    cuentas
  #  end
  #end
  #
  #def monto_queda_a_pagar
  #  suma = 0
  #  ref_axiento_det_al_reves.each do |det_pago|
  #    suma += det_pago.importe
  #  end
  #  documento_det.precio_bruto - suma
  #end
  #
  #def cuenta_num
  #  unless cuenta.nil?
  #    cuenta.cuenta
  #  end
  #end
  #
  #def fechac
  #  unless axiento.nil?
  #    axiento.fechac
  #  end
  #end
  #
  #def concepto
  #  unless axiento.nil?
  #    axiento.concepto
  #  end
  #end
  #
  #def initialize_values_default
  #  if new_record?
  #    self.importe ||= 0.00
  #  end
  #end
  #
  ##TODO revisar, como mejor hacer lo con documento_dets conectado con axiento_dets???
  #def todavia_a_pagar_para_este_cuenta_amr
  #  if amr?
  #    return importe - documento.todavia_a_pagar_para_cuenta_amr(cuenta)
  #  else
  #    Rails.logger.error "no debe executar todavia_a_pagar_para_este_cuenta_amr si no es amr"
  #  end
  #end
end
