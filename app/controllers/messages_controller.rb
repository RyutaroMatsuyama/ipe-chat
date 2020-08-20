class MessagesController < ApplicationController
   def index
     if params[:user_id]
       @id = params[:user_id]
       @messages = Message.where(reciever_id: @id, user_id: current_user.id).or(Message.where(reciever_id: current_user.id, user_id: @id))
       @message = Message.new
     else
       @messages = Message.includes(:user).where(reciever_id:nil)
       @message = Message.new
     end
   end

   def create
    @message = Message.new(create_params)
    @current_user=current_user.id
    if @message.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'メッセージを送信しました' }
        format.json
      end
    else
        redirect_to root_path, notice: 'メッセージの送信に失敗しました'
    end
   end

   def edit
     @message = Message.find(params[:id])
     unless @message.user_id == current_user.id
       redirect_to root_path, notice: '不正なアクセスです'
     end
   end

   def update
        @message = Message.find(params[:id])
        if @message.user_id == current_user.id && @message.update(update_params)
          respond_to do |format|
            format.html { redirect_to root_path, notice: '変更しました' }
            format.json
          end
        else
            redirect_to root_path, notice: '変更に失敗しました'
        end
   end

   def destroy
     @message = Message.find(params[:id])
     if @message.user_id == current_user.id && @message.destroy
       respond_to do |format|
         # format.html { redirect_to root_path, notice: '削除しました' }
         format.json
       end
     else
         redirect_to root_path, notice: '削除できませんでした'
     end
   end


   private
   def create_params
     params.require(:message).permit(:content,:image,:reciever_id).merge(user_id: current_user.id)
   end

   def update_params
     params.require(:message).permit(:content)
   end
end
