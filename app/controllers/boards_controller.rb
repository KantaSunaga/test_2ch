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
 	     redirect_to "/boards"
  end

 private

 	def params_board
 	  params.permit(:title, :editor)
 	end

end
