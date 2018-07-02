class Api::MonkeypartsController < Api::ApiController
    before_action :monkeys_list

    def create
        @monkeyp = @monkeys_list.monkeyparts.new(monkeyparts_params)
        if @monkeyp.save
            render json: { status: 200, message: "successfully created" , monkeys: @monkeys_list}.to_json
        else
            render json: { status: 500, message: "unable to create"}
        end
    end


    def update 
        @monkey = @monkeys_list.monkeyparts.find(params[:id])
        if @monkey.update(monkeyparts_params)
            render json: { status: 200, message: "updated successfully", monkey: @monkey}
        else
            render json: { status: 500, message: "unable to update"}
        end    
    end

    def destroy
        @monkey = @monkeys_list.monkeyparts.find(params[:id])
        if @monkey.destroy
            render json: { status: 200 , message: "successfully deleted", monkey: @monkey}
        else
            render json: { status: 200 , message: "error while deleting", monkey: @monkey}
        end
    end

    private

    def monkeyparts_params
        params.require(:monkeyparts).permit(:name)
    end

    def monkeys_list
        @monkeys_list = Monkey.find(params[:monkey_id])
    end

end