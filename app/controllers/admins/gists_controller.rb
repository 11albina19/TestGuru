module Admins
  class GistsController < Admins::BaseController
    skip_before_action :authenticate_user!

    def index
      @gist = Gist.all
    end
  end
end
