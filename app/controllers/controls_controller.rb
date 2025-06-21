class ControlsController < ApplicationController
  before_action :set_catalog, only: %i[ show edit update]
  allow_unauthenticated_access only: %i[ index show
]
  def index
    @controls = Catalog.all
  end

  def new
    @control = Catalog.new
  end

  def create
    @control = Catalog.new(control_params)
    if @control.save
      redirect_to @control
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @control = Catalog.find(params[:id])
    if @control.update(control_params)
      redirect_to @control
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @catalog.destroy
    redirect_to catalog_path
  end

  private
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def control_params
      params.expect(control: [ :control_id, :description, :family, :title,
    :language, :supplemental_guidance, :implementation_guidance, :nist_discussion,
    :nist_reference, :related_controls, :pvt_ref, :overlay,
    :nist_control, :check, :fix ])
    end
end
