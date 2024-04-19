# frozen_string_literal: true

# Module comment for CustomController
class CustomController < Devise::SessionsController
    def create
      super do |resource|
        redirect_to root_path and return if resource.has_role?(:admin)
      end
    end
  end