class Api::V1::Patient1Controller < ApplicationController
    #skip_before_action  :verify_authenticity_token
    before_action :doorkeeper_authorize!
    
    respond_to :json 
    def index
    
    render json: current_user.patient1s.as_json(except: [:created_at, :updated_at, :active]), status: 201
    # @patients=Patient1.all
    # @user=current_user
    # @doctor=Doctor.all
    # @patients = Patient1.all
    # render json: @patients, status: 201
    # respond_with @patients
    end

    def show
    @patient=Patient1.find(params[:id])
    end
    
    def new
        @patient=Patient1.new(user: current_user)
        @doctor=Doctor.all
    end

    def new1
    @doctor=Doctor.new(user: current_user)
    
    end

    def patient_params
        params.require(:patient).permit(:patientid, :name, :age, :sex, :email, :doctor_id, :cause, :status, :user_id)
    end

    def create
        
        @patient = current_user.patient1s.new(patient_params)
	
        if @patient.save
            render json: @patient, status: 201
        else
            render json: { errors: user.errors}, status: 422
        end
    end

    
    
    def edit
        @patients = Patient1.find(params[:id])
        @doctors = Doctor.all
    end

    def edit1
        @doctor = Doctor.find(params[:id])
       # @doctors = Doctor.all
    end
    
    def patient_param
        params.require(:patient).permit(:patientid, :name, :age, :sex, :email, :doctor_id, :cause, :status, :user_id)
    end

    def doctor_param
        params.fetch(:doctor, {}).permit(:doctorid, :name, :specialisation, :department, :user_id)
    end

    def update
        @patient = Patient1.find(params[:id])
        if @patient.update(patient_param)
            render json: @patient, status: 201
         else
            render json: { errors: user.errors}, status: 422
         end
    end

    
    
    def destroy
        Patient1.find(params[:id]).destroy
        render json: {message: "Patient is successfully deleted"}, status: 200
    end

    private
    def current_user
        @current_user = User.find(doorkeeper_token.resource_owner_id)
        
    end



end
