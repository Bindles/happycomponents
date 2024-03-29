class ComponentsController < ApplicationController
  before_action :set_component, only: %i[ show edit update destroy ]

  def htmxer
    @components = Component.all
  end
  
# app/controllers/components_controller.rb
def gunparam
  @abc = "ABC"
  puts 'HUHAIUSHSHAKSH'
  @component_name = params[:component_name]
  # Additional logic as needed
end


# app/controllers/components_controller.rb
def inspectc
  @component_id = params[:id]
  puts @component_id
  @selected_component = Component.find(@component_id)
  puts @selected_component.inspect
  #flash[:notice] = "Nice"
  #value = flash[:my_var]
  #puts value.class.inspect
  puts "ASKAJSKLAJSLKAJSLKAJS"
  puts @component.inspect
  puts params[:format]
  puts params[:id]
# Extract the numeric part from the params[:id]
  @component_id = params[:id].to_s.scan(/\d+/).first
  puts @component_id
  puts params[:id]
  #@selected_component = Component.find(1)
  puts @selected_component
  puts @selected_component[:name]
                                      #append
    #render turbo_stream: turbo_stream.replace('targ', partial: 'test_partial', locals: { component: @component})
    #render turbo_stream: turbo_stream.remove("modalFrame_#{params[:id]}")
    render turbo_stream: turbo_stream.replace("modalFrame", partial: 'modal_content', locals: { component: @selected_component })
    #render turbo_stream: turbo_stream.append("modalFrame", partial: 'modal_content', locals: { component: @selected_component, id: @selected_component.id })

    
end

  # GET /components or /components.json
  def index
    @my_var = "This is an instance variable IT WORKED"
    flash[:my_var] = @my_var
    #sort_by = params[:sort_by]
    #order   = params[:order]


    @components = if params[:search]
      Component.where('name LIKE ?', "%#{params[:search]}%")
    else
      Component.all
    end

  if params[:sort_by].present? && params[:order].present?
  @components = @components.order(params[:sort_by] => params[:order])
  end

  end
  # GET /components/1 or /components/1.json
  def show
    flash[:notice] = "My Test"
  end

  # GET /components/new
  def new
    @component = Component.new
  end

  # GET /components/1/edit
  def edit
  end

  # POST /components or /components.json
  def create
    @component = Component.new(component_params)

    respond_to do |format|
      if @component.save
        format.html { redirect_to component_url(@component), notice: "Component was successfully created." }
        format.json { render :show, status: :created, location: @component }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /components/1 or /components/1.json
  def update
    respond_to do |format|
      if @component.update(component_params)
        format.html { redirect_to component_url(@component), notice: "Component was successfully updated." }
        format.json { render :show, status: :ok, location: @component }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1 or /components/1.json
  def destroy
    @component.destroy!

    respond_to do |format|
      format.html { redirect_to components_url, notice: "Component was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component
      @component = Component.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def component_params
      params.require(:component).permit(:name, :lang, :category, :code, :desc)
    end
end
