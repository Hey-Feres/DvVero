RailsAdmin.config do |config|
  # config.authenticate_with do
  #   authenticate_or_request_with_http_basic('Site Message') do |username, password|
  #     username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
  #   end
  # end
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    # export
    bulk_delete
    show
    edit
    delete
    # show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.excluded_models = %w[ActiveStorage::Blob ActiveStorage::Attachment ActiveStorage::VariantRecord]

  config.model 'Section' do
    list do
      sort_by :sort_position

      field :sort_position
      field :title
      field :created_at
    end

    show do
      field :title
      field :sort_position
      field :desktop_image
      field :mobile_image
      field :active
    end

    edit do
      field :title
      # field :content
      field :sort_position
      field :desktop_image
      field :mobile_image
      # field :background_color, :color
      # field :text_color, :color
      field :active
    end
  end
end
