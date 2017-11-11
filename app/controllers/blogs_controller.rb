class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
    respond_to do |format|
     format.html
     format.js
    end
  end
  
  # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end
  
  def new
    if params[:back] #戻るボタンのparametersが来た時はデータを保持
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.create(blogs_params) #Blog.newで送られたパラメータをDBへ保存。blogs_paramsなので↓で定義されたストロングパラメータを使用
    @blog.user_id = current_user.id
    if @blog.save
     redirect_to blogs_path, notice: "ブログを作成しました！"
     NoticeMailer.sendmail_blog(@blog).deliver
    else
      render 'new'
    end
  end
  
  def edit
 #   @blog = Blog.find(params[:id]) #パラメータに一致する値をDBから検索
  end
  
  def update
  #  @blog = Blog.find(params[:id])
    if @blog.update(blogs_params)
     redirect_to blogs_path, notice: "ブログを更新しました！"
    else
      render 'edit'
    end
  end
    
  def destroy
#    @blog = Blog.find(params[:id])
    @blog.destroy
      respond_to do |format|
       format.html
       format.js
       redirect_to blogs_path, notice: "ブログを削除しました！"
      end
  end
  
  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid? #バリデーションに失敗したら投稿画面に戻す
  end

  
  private
  def blogs_params #blogs_params名でストロングパラメータを定義
    params.require(:blog).permit(:title, :content) #paramsメソッド内のblogに関する情報かつ、titleとcontentのみ取り出し可能
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
  

end