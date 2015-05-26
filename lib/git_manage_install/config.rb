require "xdg"
require "yaml"

module GitManageInstall
  class Config
    include XDG::BaseDir::Mixin

    def configuration
      @configuration ||= YAML.load_file config_file
    end

    def config_file
      config.home.find("packages.yml") or raise "missing config file packages.yml"
    end

    def subdirectory
      "git-manage-install"
    end
  end
end
