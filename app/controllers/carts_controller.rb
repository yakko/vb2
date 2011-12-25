class CartsController < ApplicationController


  # GET /cart
  def current
    @cart = current_cart
    render :edit
  end

  # POST /cart/add
  def add
    @cart = current_cart
    @cart.add(params[:product_id])
    session[:cart_id] = @cart.id
    render :edit
  end

  # POST /cart/delete
  def delete
    @cart = current_cart
    @cart.del(params[:cart_product_id]).to_s
    render :edit
  end
  


  
  # TODO: name these comments properly with all the matching URLs to each action
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
    
=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # index.html.erb
      format.js   {  } # index.js.erb
      format.atom {  } # index.atom.builder
      format.json { render json: @carts }
      format.xml  { render xml: @carts }
      format.yaml { render text: @carts.to_yaml }
    end
=end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.find(params[:id])

=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # show.html.erb
      format.js   {  } # show.js.erb
      format.atom {  } # show.atom.builder
      format.json { render json: @cart }
      format.xml  { render xml: @cart }
      format.yaml { render text: @cart.to_yaml }
    end
=end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # show.html.erb
      format.js   {  } # show.js.erb
      format.atom {  } # show.atom.builder
      format.json { render json: @cart }
      format.xml  { render xml: @cart }
      format.yaml { render text: @cart.to_yaml }
    end
=end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
    
=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # show.html.erb
      format.js   {  } # show.js.erb
      format.atom {  } # show.atom.builder
      format.json { render json: @cart }
      format.xml  { render xml: @cart }
      format.yaml { render text: @cart.to_yaml }
    end
=end
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])
    
    session[:cart_id] = @cart.id
    
    if @cart.save
      redirect_to @cart, notice: 'Cart foi criado.'
    else
      render action: "new"
    end
    
=begin
    #beyond simple html
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart foi criado.' }
        format.js   {  } # create.js.erb
        format.atom {  } # create.atom.builder
        format.json { render json: @cart, status: :created, location: @cart }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      else
        format.html { render action: "new" }
        format.js   {  } # create.js.erb
        format.atom {  } # create.atom.builder
        #format.js   { render 'create_fail' } # create_fail.js.erb
        #format.atom { render 'create_fail' } # create_fail.atom.builder
        format.json { render json: @cart.errors, status: :unprocessable_entity }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      end
    end
=end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    return redirect_to :current_cart, :notice=>'not my cart' unless params[:id] == session[:cart_id].to_s
    @cart = Cart.find(params[:id])
    
    if @cart.update_attributes(params[:cart])
      redirect_to :current_cart, notice: 'Carrinho foi atualizado.'
    else
      render :edit
    end
    
=begin
    #beyond simple html
    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart foi atualizado.' }
        format.js   {  } # update.js.erb
        format.atom {  } # update.atom.builder
        format.json { head :no_content }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      else
        format.html { render action: "edit" }
        format.js   {  } # update.js.erb
        format.atom {  } # update.atom.builder
        #format.js   { render 'update_fail' } # update_fail.js.erb
        #format.atom { render 'update_fail' } # update_fail.atom.builder
        format.json { render json: @cart.errors, status: :unprocessable_entity }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      end
    end
=end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_url
    
=begin
    #beyond simple html
    respond_to do |format|
      format.html { redirect_to carts_url }
      format.js   {  } # update.js.erb
      format.atom {  } # update.atom.builder
      format.json { head :no_content }
      format.xml  {  } #TODO
      format.yaml {  } #TODO
    end
=end
  end
end
