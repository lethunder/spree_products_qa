class Spree::ProductAnswer < ActiveRecord::Base
  belongs_to :product_question

  validates :content, presence: true

  after_create :send_email, if: ->() { SpreeProductsQa.send_email? }

  def send_email
    QaMailerJob.perform_later self.question.id if self.question.present?
  end
end
