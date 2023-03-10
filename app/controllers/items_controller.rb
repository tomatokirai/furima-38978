class ItemsController < ApplicationController

end

def new
  @items = Irem.new

private

def message_params
  params.require(:item).permit(:image).merge(user_id: current_user.id)
end