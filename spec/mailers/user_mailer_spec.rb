require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'notification_email' do
    let(:user) { create(:user, email: 'test@example.com') }
    let(:work) { create(:work) }
    let(:mail) { UserMailer.notification_email(user, work) }

    it 'renders the headers correctly' do
      expect(mail.subject).to eq("it's just 1 one left before your next appointment")
      expect(mail.to).to eq(['test@example.com'])
      expect(mail.from).to eq(['auto_assistant@auto.com'])
    end

    it 'renders the body correctly' do
      expect(mail.body.encoded).to match("Dear #{user.email}")
      expect(mail.body.encoded).to match("Your next appointment is scheduled for")
      expect(mail.body.encoded).to match(work.date.to_s)
    end
  end


end

