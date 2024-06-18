loader = Rails.autoloaders.main
module Api; end
loader.push_dir(Rails.root.join('app/api'), namespace: Api)
