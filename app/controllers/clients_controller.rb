class ClientsController < ApplicationController
    
    before_action :set_client, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
   def index
    @clients = Client.all
   end 
   
   def new
    @client = Client.new
   end
   
   def edit
        
   end

    def create
        @client = Client.new(client_params)
        @client.user = current_user
        if @client.save
            flash[:success]="Client was successfully registered"
            redirect_to client_path(@client)
        else
            render 'new'
        end
    end
    
    def update
        if @client.update(client_params)
            flash[:success]="Client was successfully updated"
            redirect_to client_path(@client)
        else
            render 'edit'
        end
    end
    
    def show 
        
    end
   
    def destroy
       @client.destroy
       flash[:success]="Client was successfully deleted"
       redirect_to clients_path
    end   
    
    
    private
        def set_client
          @client = Client.find(params[:id])
        end
        
        def client_params
            params.require(:client).permit(:name, :address, :phone_number, :appointed_retained, :alleged_offenses,  
            :hearing_dates, :beginning_date, :disposition_date, :time_in_court, :time_outside_of_court, :time_waiting_in_court, 
            :date_of_first_client_interaction, :sentencing_judge, :disposition_date, :case_outcome, category_ids:[])
        end
        
        def require_same_user
            if current_user != @client.user and !current_user.admin?
            flash[:danger] = "You can only update or delete your own clients"
            redirect_to root_path
            end
        end
end