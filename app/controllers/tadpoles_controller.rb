class TadpolesController < ApplicationController
  before_action :set_tadpole, only: [:show, :edit, :update, :destroy, :metamorphose]

  # add your metamorphose action here
  def metamorphose
  end

  it "makes a new frog with the tadpole's name, color, and pond" do
    post "/tadpoles/#{@tadpole.id}/metamorphose"
    found_by_name = Frog.find_by(:name => @tadpole.name)
    found_by_color = Frog.find_by(:color => @tadpole.color)
    expect(found_by_color.name).to eq(@tadpole.name)
    expect(found_by_name.color).to eq(@tadpole.color)
    expect(found_by_name.pond).to eq(@tadpole.pond)
    expect(found_by_name).to eq(found_by_color)

  def index
    @tadpoles = Tadpole.all
  end

  def show
  end

  def new
    @frog = Frog.find(set_frog)
    @tadpole = Tadpole.new
  end

  def edit
    @frog = @tadpole.frog
  end

  def create
    @tadpole = Tadpole.new(tadpole_params)
    respond_to do |format|
      if @tadpole.save
        format.html { redirect_to @tadpole, notice: 'Tadpole was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tadpole.update(tadpole_params)
        format.html { redirect_to @tadpole, notice: 'Tadpole was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tadpole.destroy
    respond_to do |format|
      format.html { redirect_to tadpoles_url, notice: 'Tadpole was successfully destroyed.' }
    end
  end

  private
    def set_tadpole
      @tadpole = Tadpole.find(params[:id])
    end

    def set_frog
      @frog = Frog.find(params[:frog_id])
    end

    def tadpole_params
      params.require(:tadpole).permit(:name, :color, :frog_id)
    end
end
