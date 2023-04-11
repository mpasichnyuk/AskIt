# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def name_or_email
    (name.presence || email.split('@')[0])
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
end
