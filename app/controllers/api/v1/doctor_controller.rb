class Api::V1::DoctorController < ApplicationController
    protect_from_forgery with: :exception
    before_action :doorkeeper_authorize!
    respond_to :json 
    def index
    render json: current_user.doctors.as_json(except: [:created_at, :updated_at, :active]), status: 201
   # @patients=Patient1.all
   # @user=current_user
   # @doctor=Doctor.all
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

    def doctor_params
        params.require(:doctor).permit(:doctorid, :name, :specialisation, :department, :user_id)
    end
    
    

    def create
        @doctor = current_user.doctors.new(doctor_params)
	
        if @doctor.save
            render json: @doctor, status: 201
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
    
    

    def doctor_param
        params.fetch(:doctor, {}).permit(:doctorid, :name, :specialisation, :department, :user_id)
    end

   

    def update
        @doctor = Doctor.find(params[:id])
        if @doctor.update(patient_param)
            render json: @doctor, status: 201
         else
            render json: { errors: user.errors}, status: 422
         end
    end
    
    

    def destroy
        Doctor.find(params[:id]).destroy
        render json: {message: "Doctor is successfully deleted"}, status: 200
    end
    
    
    def show_doctor
        @doctor=Doctor.all
    end
    def show_doctor1
        @doctor=Doctor.find(params[:id])
        @name=@doctor.name
        @patients=@doctor.patient1s
    end

    private
    def current_user
        @current_user = User.find(doorkeeper_token.resource_owner_id)
        
    end
end
