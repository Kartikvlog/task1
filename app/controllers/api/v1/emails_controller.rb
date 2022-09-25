module Api 
  module V1
    class EmailsController < ApplicationController
      def index
        emails = Email.all 
        render json: {status: 'SUCCESS', message:'Loaded Emails',data:emails},status: :ok
      end

      def show
        email = Email.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded Email',data:email},status: :ok
      end

      def create 
        email = Email.new(email_params)
        if email.save
          render json: {status: 'SUCCESS', message:'saved Emails',data:email},status: :ok
        else
          render json: {status: 'Error', message:'Email not saved',
          data:email.errors},status: :unprocessable_entity
        end   
      end

      def destroy
        email = Email.find(params[:id])
        email.destroy
        render json: {status: 'SUCCESS', message:'Emails Deleted',data:email},status: :ok
      end

      def update
        email = Email.find(params[:id])
        if email.update(email_params)
          render json: {status: 'SUCCESS', message:'Emails Updated',data:email},status: :ok
        else
          render json: {status: 'Error', message:'Emails not updated',
          data:email.errors},status: :unprocessable_entity
        end
      end

      private
      def email_params
        params.permit(:email)
      end
    end
  end
end