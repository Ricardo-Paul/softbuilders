class DirectUploadsController < ActiveStorage::DirectUploadsController
    skip_before_action :verify_authenticity_token
    # protect_from_forgery with: :null_session

    def create
        blob = ActiveStorage::Blob.create_before_direct_upload!(blob_args)
        render json: ['direct upload here']
        byebug
    end
end

#class DirectUploadsController < ActiveStorage::DirectUploadsController
