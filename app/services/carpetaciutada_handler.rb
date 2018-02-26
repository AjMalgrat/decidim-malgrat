# frozen_string_literal: true

# Checks the authorization against the census for Malgrat.

require "digest/md5"

class CarpetaciutadaHandler < Decidim::AuthorizationHandler
  include ActionView::Helpers::SanitizeHelper
  include Virtus::Multiparams

  attribute :date_of_birth, Date
  attribute :document_number, String

  validates :date_of_birth, presence: true
  validates :document_number, format: { with: /\A\d{8}\w\z/ }, presence: true

  validate :over_16
  validate :person_valid


  private
  def person_valid
    return nil if response.blank?
    errors.add(:document_number, I18n.t("decidim.authorization_handlers.carpetaciutada_handler.invalid_person")) unless response.xpath("//descMunicipi").text == "MALGRAT DE MAR"
  end

  def sanitized_date_of_birth
    @sanitized_date_of_birth ||= date_of_birth&.strftime("%Y%m%d")
  end

  def sanitize_document_number
    document_number.to_i
  end

  def over_16
    errors.add(:date_of_birth, I18n.t("decidim.authorization_handlers.carpetaciutada_handler.age_under_16")) unless age && age >= 16
  end

  def age
    return nil if date_of_birth.blank?

    now = Date.current
    extra_year = (now.month > date_of_birth.month) || (
      now.month == date_of_birth.month && now.day >= date_of_birth.day
    )

    now.year - date_of_birth.year - (extra_year ? 0 : 1)
  end

  def response
    return nil if document_number.blank? ||
                  date_of_birth.blank?

    return @response if defined?(@response)

    response ||= Faraday.post Rails.application.secrets.carpetaciutada[:url] do |request|
      request.headers["Content-Type"] = "text/xml"
      request.body = request_body
    end

    @response ||= Nokogiri::XML(response.body).remove_namespaces!
  end

  def request_body
    @request_body ||= <<-REQBODY
    <soapenv:Envelope
      xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
      xmlns:hab="http://habitants.ws.genesys.audifilm.com/">
         <soapenv:Header/>
         <soapenv:Body>
            <hab:doCercaHabitants>
               <arg0>
                  <aplicacio>#{Rails.application.secrets.carpetaciutada[:app]}</aplicacio>
                  <nivell>#{Rails.application.secrets.carpetaciutada[:level]}</nivell>
                  <usuari>#{Rails.application.secrets.carpetaciutada[:user]}</usuari>
                  <nifnum>#{sanitize_document_number}</nifnum>
                  <persndataIni>#{sanitized_date_of_birth}</persndataIni>
                  <persndataFi>#{sanitized_date_of_birth}</persndataFi>
               </arg0>
            </hab:doCercaHabitants>
         </soapenv:Body>
      </soapenv:Envelope>
      REQBODY
  end
end
