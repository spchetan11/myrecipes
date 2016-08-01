class ChefsController < ApplicationController

    before_action :require_same_user, only: [:edit, :update]

    def index
        @chefs = Chef.paginate(page: params[:page], per_page: 5)
    end

    def show
    	@chef = Chef.find(params[:id])
    	@recipes = @chef.recipes.paginate(page: params[:page], per_page: 5)
    end

	def new
		@chef = Chef.new
	end


	def create
		@chef = Chef.new(chef_params)
		if @chef.save
			flash[:success] = "Your account has been created successfully"
			redirect_to chef_path(@chef)
		else
			render 'new'
		end
	end
    
    def edit
    	@chef = Chef.find(params[:id])
    end

    def update
    	@chef = Chef.find(params[:id])
    	if @chef.update(chef_params)
    		flash[:success] = "Your profile has been updated successfully"
    		redirect_to recipes_path
    	else
    		render 'edit'
    	end
    end

    private

    def chef_params
    	params.require(:chef).permit(:chefname, :email, :password)
    end

    def require_same_user
        if current_user != @chef
            flash[:danger]="Your can only edit your own profile"
            redirect_to recipes_path
        end
    end
end
