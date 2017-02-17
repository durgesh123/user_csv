class UserCsvUploadsController < ApplicationController
  before_action :set_user_csv_upload, only: [:show, :edit, :update, :destroy]

  # GET /user_csv_uploads
  # GET /user_csv_uploads.json
  def index
    @user_csv_uploads = UserCsvUpload.all
  end

  # GET /user_csv_uploads/1
  # GET /user_csv_uploads/1.json
  def show
  end

  # GET /user_csv_uploads/new
  def new
    @user_csv_upload = UserCsvUpload.new
  end

  # GET /user_csv_uploads/1/edit
  def edit
  end

  # POST /user_csv_uploads
  # POST /user_csv_uploads.json
  def create
    @user_csv_upload = UserCsvUpload.new(user_csv_upload_params)

  uploaded_io = params[:name]
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
  end

    respond_to do |format|
      if @user_csv_upload.save
        format.html { redirect_to @user_csv_upload, notice: 'User csv upload was successfully created.' }
        format.json { render :show, status: :created, location: @user_csv_upload }
      else
        format.html { render :new }
        format.json { render json: @user_csv_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_csv_uploads/1
  # PATCH/PUT /user_csv_uploads/1.json
  def update
    respond_to do |format|
      if @user_csv_upload.update(user_csv_upload_params)
        format.html { redirect_to @user_csv_upload, notice: 'User csv upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_csv_upload }
      else
        format.html { render :edit }
        format.json { render json: @user_csv_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_csv_uploads/1
  # DELETE /user_csv_uploads/1.json
  def destroy
    @user_csv_upload.destroy
    respond_to do |format|
      format.html { redirect_to user_csv_uploads_url, notice: 'User csv upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_csv_upload
      @user_csv_upload = UserCsvUpload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_csv_upload_params
      params.require(:user_csv_upload).permit(:name)
    end
end
