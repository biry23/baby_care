class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!
end
