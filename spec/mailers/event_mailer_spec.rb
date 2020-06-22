require "rails_helper"

RSpec.describe EventMailer, type: :mailer do
  describe "subscription" do
    let(:mail) { EventMailer.subscription }

    it "renders the headers" do
      expect(mail.subject).to eq("Subscription")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "comment" do
    let(:mail) { EventMailer.comment }

    it "renders the headers" do
      expect(mail.subject).to eq("Comment")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
