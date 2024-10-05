class JournalsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_journal, only: %i[show edit update destroy]
  
    def index
      @journals = current_user.journals
    end
  
    def new
      @journal = Journal.new
    end
  
    def create
        @journal = current_user.journals.new(journal_params)
        @journal.public_link = SecureRandom.hex(10) # Generate a random public link
      
        if @journal.save
          redirect_to @journal, notice: "Journal entry created successfully."
        else
          # If saving fails, render the 'new' template again, showing validation errors
          flash.now[:alert] = @journal.errors.full_messages.to_sentence
          render :new
        end
    end
      
      
  
    def show
    end
  
    def edit
    end
  
    def update
        # Store the current public link before the update
        public_link = @journal.public_link
        
        # Attempt to update the journal, excluding the public_link from journal_params
        if @journal.update(journal_params.except(:public_link))
          # Ensure the public_link remains the same
          @journal.update(public_link: public_link)
          
          redirect_to @journal, notice: "Journal entry updated successfully."
        else
          render :edit
        end
    end
      
  
    def destroy
      @journal.destroy
      redirect_to journals_path, notice: "Journal entry deleted successfully."
    end

    def public_show
        @journal = Journal.find_by(public_link: params[:public_link])
        
        if @journal.nil?
          redirect_to journals_path, alert: "Journal not found."
        else
          # If the current user is not the creator, set a flag for read-only access
          @read_only = current_user != @journal.user
        end
    end
          
  
    private
  
    def set_journal
      @journal = Journal.find(params[:id])
    end
  
    def journal_params
      params.require(:journal).permit(:title, :content, :public_link, :attachment)
    end
  end
  