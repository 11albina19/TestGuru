# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <mail-for-sending-messages@yandex.ru>)
  layout 'mailer'
end
