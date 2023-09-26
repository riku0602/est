class MenusController < ApplicationController
  def main
    @menus = Menu.where(category:"main")
  end

  def zensai
    @menus = Menu.where(category:"zensai")
  end

  def drink
    @menus = Menu.where(category:"drink")
  end

  def cake
    @menus = Menu.where(category:"cake")
  end

  def index
        
        if params[:search] == nil
          @menus= Menu.all
        elsif params[:search] == ''
          @menus= Menu.all
        else

          @menus = Menu.where("body LIKE ? ",'%' + params[:search] + '%')
        end
    end

    def new
        @menus = Menu.new
        @category = params[:category]
      end 


      def create
        menu = Menu.new(menu_params)
        if menu.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @menu = Menu.find(params[:id])
    end

    def edit
        @menu = Menu.find(params[:id])
    end

    def update
      menu = Menu.find(params[:id])
      if menu.update(menu_params)
        redirect_to :action => "show", :id => menu.id
      else
        redirect_to :action => "new"
      end
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to action: :index
  end

      private
      def menu_params
        params.require(:menu).permit(:name, :image, :about, :price,:category)
      end

end
