class Patient1Controller < ApplicationController
    def list
   
    @patients=Patient1.all
    @doctor=Doctor.all
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
        @patient = current_user.patient1s.new(patient_params)
	
        if @patient.save
           redirect_to :action => 'list'
        else
            @doctor=Doctor.all
            render :action => 'new'
        end
    end

    def create1
        @doctor = current_user.doctors.new(doctor_params)
	
        if @doctor.save
           redirect_to :action => 'show_doctor'
        else
            @doctor=Doctor.all
            render :action => 'new1'
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
        params.fetch(:patient1, {}).permit(:patientid, :name, :age, :sex, :email, :doctor_id, :cause, :status, :user_id)
    end

    def doctor_param
        params.fetch(:doctor, {}).permit(:doctorid, :name, :specialisation, :department, :user_id)
    end

    def update
        @patient = Patient1.find(params[:id])
        if @patient.update_attributes(patient_param)
            redirect_to :action => 'show', :id => @patient
         else
            @doctors = Doctor.all
            render :action => 'edit'
         end
    end

    def update1
        @doctor = Doctor.find(params[:id])
        if @doctor.update_attributes(doctor_param)
            redirect_to :action => 'show_doctor', :id => @doctor
         else
            @doctors = Doctor.all
            render :action => 'edit1'
         end
    end
    
    def delete
        Patient1.find(params[:id]).destroy
        redirect_to :action => 'list'
    end

    def delete1
        Doctor.find(params[:id]).destroy
        redirect_to :action => 'show_doctor'
    end
    
    
    def show_doctor
        @doctor=Doctor.all
    end
    def show_doctor1
        @doctor=Doctor.find(params[:id])
        @name=@doctor.name
        @patients=@doctor.patient1s
    end
end
