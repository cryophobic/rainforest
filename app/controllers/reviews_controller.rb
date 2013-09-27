class ReviewsController < ApplicationController
  before_filter :load_product
  before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to product_path(@product.id), notice: 'Review created successfully' }
        format.js {} # This will look for /views/reviews/create.js.erb
      else
        format.html { render "products/show", notice: 'You have already made a review on this product!'  }
        format.js {} # This will look for /views/reviews/create.js.erb
      end
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def load_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:comment, :user_id, :product_id, :name)
  end
end
