require 'spec_helper'

describe Attachment do
  let(:attachment) { FactoryGirl.build :attachment}

  describe 'attributes' do
    # Validations

    it { expect(attachment).to have_attached_file :file}

    it { expect(attachment).to validate_attachment_content_type(:file).
                                   allowing("image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf","application/vnd.ms-excel",
                                            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                            "application/msword",
                                            "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                            "text/plain") }

    # Associations
    it { expect(attachment).to belong_to(:message) }

    it "save attributes" do
      attachment.save!
      expect(attachment).to be_valid
    end
  end
end
