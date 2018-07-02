class Api::MonkeysController < Api::ApiController
    before_action :set_monkey , only: [:edit, :update, :show]

    def index
        render json: Monkey.all
    end

    def show
        render json: @monkey.as_json(include: :monkeyparts)
    end

    def create
        @monkey = Monkey.new(monkey_params)
        if @monkey.save
            render json: { status: 200, message: "successfully created" , monkeys: Monkey.all}.to_json
        else
            render json: { status: 500, message: "unable to create"}
        end
    end

    def update 
        # @monkey = Monkey.find(params[:id])
        if @monkey.update(monkey_params)
            render json: { status: 200, message: "updated successfully", monkey: @monkey}
        else
            render json: { status: 500, message: "unable to update"}
        end    
    end

    def destroy
        @monkey = Monkey.find(params[:id])
        if @monkey.destroy
            render json: { status: 200 , message: "successfully deleted", monkey: @monkey}
        else
            render json: { status: 200 , message: "error while deleting", monkey: @monkey}
        end
    end


    private

    def set_monkey
        @monkey = Monkey.find(params[:id])
    end

    def monkey_params
        params.require(:monkey).permit(:name, :age)
    end

end