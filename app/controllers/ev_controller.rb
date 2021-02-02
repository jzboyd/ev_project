class EvController < ApplicationController 
    def index
        render json: Ev.all
    end

    def show
        render json: Ev.find(params["id"])
    end

    def create
        render json: Ev.create(params["ev"])
    end

    def delete
        render json: Ev.delete(params["id"])
    end

    def update
        render json: Ev.update(params["id"], params["make"], params["body_style"], params["model"], params["trim_level"], params["year"])
    end
end
