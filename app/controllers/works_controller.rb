class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]


  # GET /works
  # GET /works.json
  def index
    @works = Work.all
  end

  def pannel_control
    @works = Work.all
    render :pannel_control
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)
    if @work.save
        if params[:images]
          params[:images].each { |image|
        @work.images.create(image: image)
      }
    end

      flash[:notice] = "Progetto Caricato"
      @works = Work.all
      render :index
    else
      flash[:notice] = "Errore Progetto non caricato"
    render :index
    end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { render :pannel_control, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
      @works = Work.all
    end
  end

  def send_email
    Pony.mail({
  :from => params[:email],
      :to => 'sbabbari@gmail.com',
      :subject => params[:name] + " " + params[:email] + " " + " ti ha mandato un messaggio",
      :body => params[:message] ,
      :via => :smtp,
      :via_options => {
       :address              => 'smtp.gmail.com',
       :port                 => '587',
       :enable_starttls_auto => true,
       :user_name            => ENV['email_gmail'],
       :password             => ENV['password_gmail'],
       :authentication       => :plain,
       }
      })
      flash[:notice] = "Messaggio invitato"
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:title , :description)
    end
end
