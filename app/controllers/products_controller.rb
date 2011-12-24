class ProductsController < ApplicationController
  
  # TODO: name these comments properly with all the matching URLs to each action
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    
=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # index.html.erb
      format.js   {  } # index.js.erb
      format.atom {  } # index.atom.builder
      format.json { render json: @products }
      format.xml  { render xml: @products }
      format.yaml { render text: @products.to_yaml }
    end
=end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # show.html.erb
      format.js   {  } # show.js.erb
      format.atom {  } # show.atom.builder
      format.json { render json: @product }
      format.xml  { render xml: @product }
      format.yaml { render text: @product.to_yaml }
    end
=end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # show.html.erb
      format.js   {  } # show.js.erb
      format.atom {  } # show.atom.builder
      format.json { render json: @product }
      format.xml  { render xml: @product }
      format.yaml { render text: @product.to_yaml }
    end
=end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    
=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # show.html.erb
      format.js   {  } # show.js.erb
      format.atom {  } # show.atom.builder
      format.json { render json: @product }
      format.xml  { render xml: @product }
      format.yaml { render text: @product.to_yaml }
    end
=end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    
    if @product.save
      redirect_to @product, notice: 'Product foi criado.'
    else
      render action: "new"
    end
    
=begin
    #beyond simple html
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product foi criado.' }
        format.js   {  } # create.js.erb
        format.atom {  } # create.atom.builder
        format.json { render json: @product, status: :created, location: @product }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      else
        format.html { render action: "new" }
        format.js   {  } # create.js.erb
        format.atom {  } # create.atom.builder
        #format.js   { render 'create_fail' } # create_fail.js.erb
        #format.atom { render 'create_fail' } # create_fail.atom.builder
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      end
    end
=end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
      redirect_to @product, notice: 'Product foi atualizado.'
    else
      render action: "edit"
    end
    
=begin
    #beyond simple html
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product foi atualizado.' }
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
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      end
    end
=end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
    
=begin
    #beyond simple html
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js   {  } # update.js.erb
      format.atom {  } # update.atom.builder
      format.json { head :no_content }
      format.xml  {  } #TODO
      format.yaml {  } #TODO
    end
=end
  end
end
