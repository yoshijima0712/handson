Handson::App.controllers :todo do
  
  get :index do
    @todos = Todo.all
    render :index
  end

  get :new do
    @todo = Todo.new
    render :new
  end

  post :new do
    Todo.create params[:todo]
    # Todo.create {:name => 'hoge'} 
    redirect url(:todo, :index)
  end

  get :remove, :with => :id do
    todo = Todo.find params[:id]
    todo.destroy
    redirect url(:todo, :index)
  end

  get :update, :with => :id do
    begin
      @todo = Todo.find params[:id]
    rescue
      halt 404
    end
    render :update
  end

  post :update, :with => :id do
    todo = Todo.find params[:id]
    todo.update_attributes params[:todo]
    redirect url(:todo, :index)
  end
end
