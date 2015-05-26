require "xdg"

module GitManageInstall
  class Config
    include XDG::BaseDir::Mixin

    def subdirectory
      "git-manage-install"
    end
  end
end
