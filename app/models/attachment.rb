class Attachment < ActiveRecord::Base
  belongs_to :message

  has_attached_file :file

  validates_attachment :file, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf","application/vnd.ms-excel",
                                                             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                                             "application/msword",
                                                             "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                                             "text/plain"] }
end
