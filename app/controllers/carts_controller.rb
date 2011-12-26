class CartsController < ApplicationController

  #unused
  # GET /cart
  def current
    @cart = current_cart
    #render :show
    redirect_to :root
  end

  # POST /cart/add
  def add
    @cart = current_cart
    @cart.add(params[:product_id])
    session[:cart_id] = @cart.id
    #render :show
    redirect_to :root
  end

  #unused
  # POST /cart/delete
  def delete
    @cart = current_cart
    @cart.del(params[:cart_product_id]).to_s
    #render :show
    redirect_to :root
  end
  
  def checkout
=begin
    case params[:gateway]
       when 'paypal'            then paypal()
       when 'pagseguro'         then pagseguro()
       when 'pagamentodigital'  then pagamentodigital()
       else return redirect_to :current_cart
    end
=end
    @post_url = "https://pagseguro.uol.com.br/checkout/checkout.jhtml"
    
    @post_hash = {
      :email_cobranca => APP_CONFIG[:business_email],
      :tipo           => 'CP',
      :moeda          => 'BRL',
      :tipo_frete     => 'EN'#, #EN ou SD para Economica ou Sedex, se nao preencher ele pergunta ao cliente
      #:extras         => -1 * cart.total_discount_cents(seller.try(:discount_rate))
    }
    
    #@post_hash[:ref_transacao] = order.id
    i = 1
    current_cart.cart_products.each do |cp|
      @post_hash["item_valor_#{i}"] = cp.price_now_cents
      @post_hash["item_quant_#{i}"] = cp.amount
      @post_hash["item_descr_#{i}"] = ActiveSupport::Inflector.transliterate(cp.product.name)
      @post_hash["item_id_#{i}"]    = cp.product_id
      i += 1
    end
    
    render :layout => false
    #render :inline => "<h2>redirecionou para #{params[:gateway]}</h2>"
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

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    return redirect_to :current_cart, :notice=>'not my cart' unless params[:id] == session[:cart_id].to_s
    @cart = Cart.find(params[:id])
    
    if @cart.update_attributes(params[:cart])
      if params[:pay]
        redirect_to checkout_path
      else
        redirect_to :back, notice: 'Carrinho foi atualizado.'
      end
    else
      render :show
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

end
