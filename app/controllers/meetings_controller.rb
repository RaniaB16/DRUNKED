class MeetingsController < ApplicationController
  skip_before_action :authenticate_user!
end
