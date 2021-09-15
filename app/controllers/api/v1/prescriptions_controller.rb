class Api::V1::PrescriptionsController < Api::V1::BaseController
    before_action :set_prescription, only: [ :show ]

    def show
    end

    def set_prescription
        @prescription = Prescription.find(params[:id])
        authorize @prescription  # For Pundit
    end


    
    def create
        @prescription = Prescription.new(prescription_params)
        @prescription.user = current_user
        authorize @prescription
        if @prescription.save
            render :show, status: :created
        else
            render_error
        end
    end

    private

    def prescription_params
        params.require(:prescription).permit(:prescription_name, :side_effects)
    end

    def render_error
        render json: { errors: @prescription.errors.full_messages },
            status: :unprocessable_entity
    end
end