class BoardsController < ApplicationController
  def index
     @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])#paramaからイDを取得して、findで探し出したレコードをboardに追加
  end

  def new
    @board=Board.new
  end

  def create
 	     @board = Board.new(params_board)
 	     @board.save
 	      redirect_to board_url(@board)
  end

   def edit
     @board = Board.find(params[:id])
   end

  def update
    @board = Board.find(params[:id])
    @board.update_attributes(params_board)#更新
     redirect_to board_url(@board)
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_url
  end

 private

 	def params_board
 	  params.require(:board).permit(:title, :editor)
 	end

end
