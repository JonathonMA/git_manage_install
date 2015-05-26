require "git_manage_install/version"
require "git_manage_install/config"
require "git_manage_install/package"

module GitManageInstall
  module_function def process
    Config.new.configuration.each do |dir, repo|
      Package.new(dir, repo).clone_or_update!
    end
  end
end
