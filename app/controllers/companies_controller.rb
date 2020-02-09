class CompaniesController < ApplicationController

    def create
        company = Company.create(company_params)
        render json: company
    end

    def index
        render json: Company.all.order("created_at DESC")
    end

    def show
        company = Company.find(params[:id])
        render json: company
    end

    def update
        company = Company.find(params[:id])
        company.update(company_params)
        render json: company
    end

    private
    def company_params
        params.require(:company).permit(:name, :address)
    end
end
