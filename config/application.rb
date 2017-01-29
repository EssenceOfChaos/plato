require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module Plato
  class Application < Rails::Application
     config.time_zone = 'Eastern Time (US & Canada)'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
config.assets.paths << Rails.root.join('vendor', 'assets', 'components', 'bower_components')

# We don't want the default of everything that isn't js or css, because it pulls too many things in
config.assets.precompile.shift

# Explicitly register the extensions we are interested in compiling
config.assets.precompile.push(Proc.new do |path|
  File.extname(path).in? [
    '.html', '.erb', '.haml',                 # Templates
    '.png',  '.gif', '.jpg', '.jpeg', '.svg', # Images
    '.eot',  '.otf', '.svc', '.woff', '.ttf', # Fonts
  ]
end)
  end
end