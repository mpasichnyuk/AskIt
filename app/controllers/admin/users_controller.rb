class Admin::UsersController < ApplicationController
  # before_action :require_authentication

  def index
    respond_to do |format|
      format.html do
        @users = User.all.page(params[:page])
      end

      format.zip { respond_with_zipped_users }
    end
  end

  private

  def respond_with_zipped_users
    compressed_filestream = Zip::OutputStream.write_buffer do |zos|
      User.order(created_at: :desc).each do |user|
        zos.put_next_entry "user #{user.id}.xlsx"
        zos.print render_to_string(
          layout: false,
          handlers: [:axlsx],
          formats: [:xlsx],
          locals: {user: user},
          template: 'admin/users/user'
        )
      end
    end
    compressed_filestream.rewind

    send_data compressed_filestream.read, filename: 'users.zip'
  end
end
