class Spree::ProductQuestionsController < Spree::StoreController
  before_action :load_data, except: :new

  def index
    product_questions = @product.product_questions.answered.visible
    if allowed_params["search"].present?
      product_questions = product_questions.where('LOWER(spree_product_questions.content) LIKE ?', "%#{allowed_params["search"].downcase}%")
    end
    product_questions = product_questions.limit(8)
    render partial: "spree/product_questions/index", locals: {product_questions: product_questions, search: allowed_params["search"]}
  end

  def new
    @product = Spree::Product.find(params[:product_id])
    render partial: "spree/product_questions/question_form", locals: {product: @product}
  end

  def create
    question = @product.product_questions.new(allowed_params)
    question.user_id = current_spree_user.id
    if question.save
      flash[:notice] = t('question.sent')
      redirect_to @product
    else
      flash[:error] = question.errors.full_messages.to_sentence
      redirect_to @product
    end
  end

  private
  def load_data
    @product = Spree::Product.find(allowed_params[:product_id])
  end

  def allowed_params
    params.require(:product_question).permit(:content, :product_id, :search)
  end
end
