require 'rails_helper'


RSpec.describe UserMailer, type: :mailer do
  describe '#notification_email' do
    let(:user) { User.create(email: 'test@example.com') }
    let(:work) { Work.create(service_name: 'Test Work') }

    subject(:mail) { UserMailer.notification_email(user, work) }

    it 'renders the subject' do
      expect(mail.subject).to eq("it's just 1 one left before your next appointment")
    end

    it 'renders the recipient email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['auto_assistant@auto.com'])
    end

    it 'includes user email in the body' do
      expect(mail.body.encoded).to include(user.email)
    end

    it 'includes work title in the body' do
      expect(mail.body.encoded).to include(work.service_name)
    end
  end
end
