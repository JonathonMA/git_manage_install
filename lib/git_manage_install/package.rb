require 'pathname'

module GitManageInstall
  class Package
    def initialize(location, repo)
      @location = Pathname.new File.expand_path(location)
      @repo = repo
    end

    def cloned?
      (@location + ".git").exist?
    end

    def exist?
      @location.exist?
    end

    def misconfigured?
      exist? && !cloned?
    end

    def clone_or_update!
      if misconfigured?
        log "#{@location} is misconfigured"
        return
      end

      if cloned?
        update!
      else
        clone!
      end
    end

    def clone!
      log "Cloning #{@location}"
      system *%W(git clone #{@repo} #{@location})
    end

    def update!
      log "Updating #{@location}"
      Dir.chdir(@location) do
        system *%W(git pull)
      end
    end

    private

    def log(message)
      puts message
    end
  end
end
