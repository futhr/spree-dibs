module SpreeDibs
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_dibs'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer 'spree.gateway.payment_methods', after: 'spree.register.payment_methods' do |app|
      app.config.spree.payment_methods << Spree::Gateway::Dibs
    end

    config.to_prepare &method(:activate).to_proc
  end
end
