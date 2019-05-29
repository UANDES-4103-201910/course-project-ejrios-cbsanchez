OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '449888339101-h5qhgvpu94re0pp92p9n17vd6v71ae25.apps.googleusercontent.com', 'VcvcbwpyX58PiH_ToJw8hsyS', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end