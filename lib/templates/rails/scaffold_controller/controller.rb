<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  
  # TODO: name these comments properly with all the matching URLs to each action
  # GET <%= route_url %>
  # GET <%= route_url %>.json
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
    
=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # index.html.erb
      format.js   {  } # index.js.erb
      format.atom {  } # index.atom.builder
      format.json { render <%= key_value :json, "@#{plural_table_name}" %> }
      format.xml  { render <%= key_value :xml, "@#{plural_table_name}" %> }
      format.yaml { render <%= key_value :text, "@#{plural_table_name}.to_yaml" %> }
    end
=end
  end

  # GET <%= route_url %>/1
  # GET <%= route_url %>/1.json
  def show
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>

=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # show.html.erb
      format.js   {  } # show.js.erb
      format.atom {  } # show.atom.builder
      format.json { render <%= key_value :json, "@#{singular_table_name}" %> }
      format.xml  { render <%= key_value :xml, "@#{singular_table_name}" %> }
      format.yaml { render <%= key_value :text, "@#{singular_table_name}.to_yaml" %> }
    end
=end
  end

  # GET <%= route_url %>/new
  # GET <%= route_url %>/new.json
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>

=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # show.html.erb
      format.js   {  } # show.js.erb
      format.atom {  } # show.atom.builder
      format.json { render <%= key_value :json, "@#{singular_table_name}" %> }
      format.xml  { render <%= key_value :xml, "@#{singular_table_name}" %> }
      format.yaml { render <%= key_value :text, "@#{singular_table_name}.to_yaml" %> }
    end
=end
  end

  # GET <%= route_url %>/1/edit
  def edit
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    
=begin
    #beyond simple html
    respond_to do |format|
      format.html {  } # show.html.erb
      format.js   {  } # show.js.erb
      format.atom {  } # show.atom.builder
      format.json { render <%= key_value :json, "@#{singular_table_name}" %> }
      format.xml  { render <%= key_value :xml, "@#{singular_table_name}" %> }
      format.yaml { render <%= key_value :text, "@#{singular_table_name}.to_yaml" %> }
    end
=end
  end

  # POST <%= route_url %>
  # POST <%= route_url %>.json
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "params[:#{singular_table_name}]") %>
    
    if @<%= orm_instance.save %>
      redirect_to @<%= singular_table_name %>, <%= key_value :notice, "'#{human_name} foi criado.'" %>
    else
      render <%= key_value :action, '"new"' %>
    end
    
=begin
    #beyond simple html
    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to @<%= singular_table_name %>, <%= key_value :notice, "'#{human_name} foi criado.'" %> }
        format.js   {  } # create.js.erb
        format.atom {  } # create.atom.builder
        format.json { render <%= key_value :json, "@#{singular_table_name}" %>, <%= key_value :status, ':created' %>, <%= key_value :location, "@#{singular_table_name}" %> }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      else
        format.html { render <%= key_value :action, '"new"' %> }
        format.js   {  } # create.js.erb
        format.atom {  } # create.atom.builder
        #format.js   { render 'create_fail' } # create_fail.js.erb
        #format.atom { render 'create_fail' } # create_fail.atom.builder
        format.json { render <%= key_value :json, "@#{orm_instance.errors}" %>, <%= key_value :status, ':unprocessable_entity' %> }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      end
    end
=end
  end

  # PUT <%= route_url %>/1
  # PUT <%= route_url %>/1.json
  def update
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    
    if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
      redirect_to @<%= singular_table_name %>, <%= key_value :notice, "'#{human_name} foi atualizado.'" %>
    else
      render <%= key_value :action, '"edit"' %>
    end
    
=begin
    #beyond simple html
    respond_to do |format|
      if @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %>
        format.html { redirect_to @<%= singular_table_name %>, <%= key_value :notice, "'#{human_name} foi atualizado.'" %> }
        format.js   {  } # update.js.erb
        format.atom {  } # update.atom.builder
        format.json { head :no_content }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      else
        format.html { render <%= key_value :action, '"edit"' %> }
        format.js   {  } # update.js.erb
        format.atom {  } # update.atom.builder
        #format.js   { render 'update_fail' } # update_fail.js.erb
        #format.atom { render 'update_fail' } # update_fail.atom.builder
        format.json { render <%= key_value :json, "@#{orm_instance.errors}" %>, <%= key_value :status, ':unprocessable_entity' %> }
        format.xml  {  } #TODO
        format.yaml {  } #TODO
      end
    end
=end
  end

  # DELETE <%= route_url %>/1
  # DELETE <%= route_url %>/1.json
  def destroy
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    @<%= orm_instance.destroy %>
    redirect_to <%= index_helper %>_url
    
=begin
    #beyond simple html
    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url }
      format.js   {  } # update.js.erb
      format.atom {  } # update.atom.builder
      format.json { head :no_content }
      format.xml  {  } #TODO
      format.yaml {  } #TODO
    end
=end
  end
end
<% end -%>
